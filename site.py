# -*- coding: utf-8 -*-
import os
import random
import time

import tornado.database
import tornado.httpserver
import tornado.ioloop
import tornado.web

# Dictionary
# Key: character<delimiter>timestamp
# CF1: Character, Pinyin, Pinyin (display), English translations (make separate column family?), Used in sentences (make separate column family?)
# CF2: Tags (Source? or make separate?)
# Having a form for data entry and editing would be really nice

# How to handle chapters? Would like to have series, books, chapters, sections, subsections. Separate table?
# Sections: New Words, Notes, Drills and Practice, Reading Comprehension and Paraphrasing, Grammar, Chinese Characters, Cultural Notes

# Some day: would like to incorporate instapaper-like "learn later"

# Would like to be able to construct flash cards
# 1. Front content
# 2. Back content
# 3. Cards in set
# Capturing history would also be nice

db = tornado.database.Connection("localhost", "learning_chinese", "root")

# TODO(hammer): get examples too?
def get_vocab():
  sql = """\
SELECT a.hanzi, a.pinyin, a.english, a.part_of_speech, GROUP_CONCAT(b.tag SEPARATOR ', ') AS tags
FROM words AS a, word_tags AS b
WHERE a.word_id = b.word_id
GROUP BY a.word_id
"""
  return db.query(sql)

# TODO(hammer): Use InnoDB and make this a single transaction
def put_word(hanzi, pinyin, english, tags, pos, time_entered):
  # add to words table
  sql = """\
INSERT INTO words (`hanzi`, `pinyin`, `english`, `part_of_speech`, `time_entered`)
VALUES ('%s', '%s', '%s', '%s', %s)
""" % (hanzi, pinyin, english, pos, time_entered)
  db.execute(sql)

  # get word_id
  sql = """\
SELECT word_id
FROM words
WHERE time_entered = %s
""" % time_entered
  word_id = db.get(sql).word_id

  # add to word_tags table
  for tag in tags.split(','):
    sql = """\
INSERT INTO word_tags (word_id, tag)
VALUES (%s, '%s')
""" % (word_id, tag.strip())
    db.execute(sql)

def get_words_with_tag(tag):
  sql = """\
SELECT `hanzi`, `pinyin`, `english`, `part_of_speech`
FROM words
WHERE word_id IN 
  (SELECT word_id FROM word_tags
   WHERE LOWER(tag) LIKE '%s')
""" % tag
  return db.query(sql)

def reset_application():
  for table in ['words', 'word_tags', 'word_examples', 'quizzes', 'quiz_words']:
    sql = """\
TRUNCATE %s;
""" % table
    db.execute(sql)

class Application(tornado.web.Application):
  def __init__(self):
    handlers = [
      (r"/", MainHandler),
      (r"/vocab", VocabHandler),
      (r"/quiz", QuizHandler),
    ]
    settings = dict(
      template_path=os.path.join(os.path.dirname(__file__), "templates"),
      static_path=os.path.join(os.path.dirname(__file__), "static"),
    )
    tornado.web.Application.__init__(self, handlers, **settings)

class MainHandler(tornado.web.RequestHandler):
  def get(self):
    self.render("index.html")

  def post(self):
    if self.get_argument("action") == "reset":
      reset_application()
    self.render("index.html")

class VocabHandler(tornado.web.RequestHandler):
  def get(self):
    self.render("vocab.html", vocab=get_vocab(), new_word=None)

  # TODO(hammer): Form validation: deduplicate new words, etc.
  def post(self):
    # Add new word to vocab list
    put_word(self.get_argument("汉字"),
             self.get_argument("Pinyin"),
             self.get_argument("English"),
             self.get_argument("Tags"),
             self.get_argument("POS"),
             int(time.time()))

    # Re-render vocab page, highlighting the word just added
    self.render("vocab.html", vocab=get_vocab(), new_word=self.get_argument("汉字"))

class QuizHandler(tornado.web.RequestHandler):
  def get(self):
    self.render("quiz.html", words=None)

  def post(self):
    # get the words corresponding to a tag and randomize their order
    words = get_words_with_tag(self.get_argument("tag"))
    random.shuffle(words)
    self.render("quiz.html", words=words, front=self.get_argument("front"), tag=self.get_argument("tag"))

def main():
  http_server = tornado.httpserver.HTTPServer(Application())
  http_server.listen(8888)
  tornado.ioloop.IOLoop.instance().start()

if __name__ == "__main__":
  main()

