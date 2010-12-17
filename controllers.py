# -*- coding: utf-8 -*-
import time

from tornado.web import RequestHandler

import models

class MainHandler(RequestHandler):
  def get(self):
    self.render("index.html")

  def post(self):
    if self.get_argument("action") == "reset":
      models.reset_application()
    self.render("index.html")

class RadicalsHandler(RequestHandler):
  def get(self):
    self.render("radicals.html")

class CharactersHandler(RequestHandler):
  def get(self):
    self.render("characters.html")

class EditWordHandler(RequestHandler):
  def get(self):
    word_id = self.get_argument("word_id")
    word = models.get_words([word_id])[0]
    self.render("edit_word.html", word=word)

  def post(self):
    # Add new word to words list
    models.update_word(self.get_argument("word_id"),
                       self.get_argument("汉字"),
                       self.get_argument("Pinyin"),
                       self.get_argument("English"),
                       self.get_argument("Tags"),
                       self.get_argument("POS"),
                       int(time.time()))

    # Re-render words page, highlighting the word just added
    self.render("words.html",
                words=models.get_words(),
                new_word=None,
                edited_word=self.get_argument("汉字"))

class WordsHandler(RequestHandler):
  def get(self):
    words = models.get_words()
    tag = self.get_argument("tag", None)
    if tag:
      words = models.get_words([str(w.word_id) for w in models.get_words_with_tag(tag)])
    self.render("words.html", words=words, new_word=None, edited_word=None)

  def post(self):
    # Add new word to words list
    models.put_word(self.get_argument("汉字"),
                    self.get_argument("Pinyin"),
                    self.get_argument("English"),
                    self.get_argument("Tags"),
                    self.get_argument("POS"),
                    int(time.time()))

    # Re-render words page, highlighting the word just added
    self.render("words.html",
                words=models.get_words(),
                new_word=self.get_argument("汉字"),
                edited_word=None)

class PhrasesHandler(RequestHandler):
  def get(self):
    self.render("phrases.html")

class SentencesHandler(RequestHandler):
  def get(self):
    self.render("sentences.html")

class PassagesHandler(RequestHandler):
  def get(self):
    self.render("passages.html")

class DocumentsHandler(RequestHandler):
  def get(self):
    self.render("documents.html")

# TODO(hammer): Add some indication that a new quiz has been created
class QuizzesHandler(RequestHandler):
  def get(self):
    self.render("quizzes.html", quizzes=models.get_quizzes())

  def post(self):
    # figure out if we pressed the reset button
    if self.get_argument("action", None) == "reset":
      models.reset_quizzes()
      self.render("quizzes.html", quizzes=models.get_quizzes())

    # get the words corresponding to a tag and randomize their order
    words = [result.word_id for result in models.get_words_with_tag(self.get_argument("tag"))]

    # Check to see if there are any words
    # TODO(hammer): Should probably tell the user what's up here
    if len(words) == 0:
      self.render("quizzes.html", quizzes=models.get_quizzes())      

    # store the new quiz
    models.put_quiz(self.get_argument("tag"),
                    self.get_argument("front"),
                    int(time.time()),
                    words)

    # Re-render the quizzes page
    self.render("quizzes.html", quizzes=models.get_quizzes())

class TakeQuizHandler(RequestHandler):
  def get(self, quiz_id):
    front = models.get_quiz_front(quiz_id)
    words = models.get_quiz_words_randomized(quiz_id)

    self.render("take_quiz.html", front=front, words=words)
