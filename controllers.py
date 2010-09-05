# -*- coding: utf-8 -*-
import random
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

class WordsHandler(RequestHandler):
  def get(self):
    self.render("words.html", words=models.get_words(), new_word=None)

  # TODO(hammer): Form validation: deduplicate new words, etc.
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
                new_word=self.get_argument("汉字"))

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

class QuizHandler(RequestHandler):
  def get(self):
    self.render("quiz.html", words=None)

  def post(self):
    # get the words corresponding to a tag and randomize their order
    words = models.get_words_with_tag(self.get_argument("tag"))
    random.shuffle(words)
    self.render("quiz.html",
                words=words,
                front=self.get_argument("front"),
                tag=self.get_argument("tag"))
