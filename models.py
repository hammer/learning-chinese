# -*- coding: utf-8 -*-

import random

import tornado.database

db = tornado.database.Connection("localhost", "learning_chinese", "root")

# TODO(hammer): get examples too?
def get_words(word_ids=None):
  sql = """\
SELECT a.word_id, a.hanzi, a.pinyin, a.english, a.part_of_speech, GROUP_CONCAT(b.tag SEPARATOR ', ') AS tags
FROM words AS a, word_tags AS b
WHERE a.word_id = b.word_id
GROUP BY a.word_id
"""
  if word_ids:
    sql += "HAVING a.word_id IN (%s)" % ",".join(word_ids)
  return db.query(sql)

# Note that we do some formatting of the timestamp
def get_quizzes():
  sql = """\
SELECT a.quiz_id, a.tag, a.front, FROM_UNIXTIME(a.time_entered) AS time_entered, COUNT(b.word_id) AS num_words
FROM quizzes AS a, quiz_words AS b
WHERE a.quiz_id = b.quiz_id
GROUP BY b.quiz_id
"""
  return db.query(sql)

def get_quiz_words_randomized(quiz_id):
  sql = """\
SELECT c.hanzi, c.pinyin, c.english
FROM quizzes AS a, quiz_words AS b, words AS c
WHERE a.quiz_id = %s AND a.quiz_id = b.quiz_id AND b.word_id = c.word_id
ORDER BY RAND(UNIX_TIMESTAMP())
""" % quiz_id
  return db.query(sql)

def get_quiz_front(quiz_id):
  sql = """\
SELECT front
FROM quizzes
WHERE quiz_id = %s
""" % quiz_id
  return db.get(sql).front

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

def update_word(word_id, hanzi, pinyin, english, tags, pos, time_entered):
  # add to words table
  sql = """\
UPDATE words
SET hanzi='%s', pinyin='%s', english='%s', part_of_speech='%s', time_entered='%s'
WHERE word_id=%s
""" % (hanzi, pinyin, english, pos, time_entered, word_id)
  db.execute(sql)

  # add to word_tags table
  sql = """\
DELETE FROM word_tags
WHERE word_id=%s
""" % word_id
  db.execute(sql)

  values_string = ','.join(["(%s, '%s')" % (word_id, tag.strip()) for tag in tags.split(',')])
  sql = """\
INSERT INTO word_tags (word_id, tag)
VALUES %s
""" % values_string
  db.execute(sql)

def put_quiz(tag, front, time_entered, words):
  # add to quizzes table
  sql = """\
INSERT INTO quizzes (`tag`, `front`, `time_entered`)
VALUES ('%s', '%s', %s)
""" % (tag, front, time_entered)
  db.execute(sql)

  # get quiz_id
  sql = """\
SELECT quiz_id
FROM quizzes
WHERE time_entered = %s
""" % time_entered
  quiz_id = db.get(sql).quiz_id

  # add words to quiz
  words_string = ",".join(["(%s, %s, 0, 0)" % (quiz_id, word_id) for word_id in words])
  sql = """\
INSERT INTO quiz_words (quiz_id, word_id, attempts, correct)
VALUES %s
""" % words_string
  db.execute(sql)

def get_words_with_tag(tag):
  # Get all tags
  tags = tag.split("+")
  tag_string = "(%s)" % ",".join(["'%s'" % tag for tag in tags])

  sql = """\
SELECT word_id
FROM words
WHERE word_id IN 
  (SELECT word_id FROM word_tags
   WHERE LOWER(tag) IN %s
   GROUP BY word_id
   HAVING COUNT(*) = %d)
""" % (tag_string, len(tags))
  return db.query(sql)

def reset_application():
  for table in ['words', 'word_tags', 'word_examples', 'quizzes', 'quiz_words']:
    sql = """\
TRUNCATE %s;
""" % table
    db.execute(sql)

def reset_quizzes():
  for table in ['quizzes', 'quiz_words']:
    sql = """\
TRUNCATE %s;
""" % table
    db.execute(sql)
