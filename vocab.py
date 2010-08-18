# -*- coding: utf-8 -*-
import os
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

# TODO(hammer): add tags and examples
def get_vocab():
  sql = """\
SELECT `hanzi`, `pinyin`, `english`
FROM words
"""
  return db.query(sql.decode('utf8'))

def put_word(hanzi, pinyin, english, time_entered):
  sql = """\
INSERT INTO words (`hanzi`, `pinyin`, `english`, `time_entered`)
VALUES ('%s', '%s', '%s', %s)
""" % (hanzi, pinyin, english, time_entered)
  return db.query(sql)

def get_words_with_tag(tag):
  sql = """\
SELECT `hanzi`, `pinyin`, `english`
FROM words
WHERE word_id IN 
  (SELECT word_id FROM word_tags
   WHERE LOWER(tag) LIKE '%s')
""" % tag
  return db.query(sql)

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

class VocabHandler(tornado.web.RequestHandler):
  def get(self):
    self.render("vocab.html", vocab=get_vocab(), new_word=None)

  # TODO(hammer): Form validation: deduplicate new words, etc.
  def post(self):
    # Add new word to vocab list
    put_word(self.get_argument("汉字"), self.get_argument("Pinyin"), self.get_argument("English"), int(time.time()))

    # Re-render vocab page, highlighting the word just added
    self.render("vocab.html", vocab=get_vocab(), new_word=self.get_argument("汉字"))

class QuizHandler(tornado.web.RequestHandler):
  def get(self):
    self.render("quiz.html", words=None)

  def post(self):
    words = get_words_with_tag(self.get_argument("tag"))
    self.render("quiz.html", words=words, front=self.get_argument("front"), tag=self.get_argument("tag"))

def main():
  http_server = tornado.httpserver.HTTPServer(Application())
  http_server.listen(8888)
  tornado.ioloop.IOLoop.instance().start()

if __name__ == "__main__":
  main()

