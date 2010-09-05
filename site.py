# -*- coding: utf-8 -*-
import os

import tornado.httpserver
import tornado.ioloop
import tornado.web

import controllers

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

class Application(tornado.web.Application):
  def __init__(self):
    handlers = [
      (r"/", controllers.MainHandler),
      (r"/radicals", controllers.RadicalsHandler),
      (r"/characters", controllers.CharactersHandler),
      (r"/words", controllers.WordsHandler),
      (r"/phrases", controllers.PhrasesHandler),
      (r"/sentences", controllers.SentencesHandler),
      (r"/passages", controllers.PassagesHandler),
      (r"/documents", controllers.DocumentsHandler),
      (r"/quiz", controllers.QuizHandler),
    ]
    settings = dict(
      template_path=os.path.join(os.path.dirname(__file__), "templates"),
      static_path=os.path.join(os.path.dirname(__file__), "static"),
    )
    tornado.web.Application.__init__(self, handlers, **settings)

def main():
  http_server = tornado.httpserver.HTTPServer(Application())
  http_server.listen(8888)
  tornado.ioloop.IOLoop.instance().start()

if __name__ == "__main__":
  main()
