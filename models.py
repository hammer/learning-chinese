# -*- coding: utf-8 -*-

import tornado.database

db = tornado.database.Connection("localhost", "learning_chinese", "root")

# TODO(hammer): get examples too?
def get_words():
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
  # Get all tags
  tags = tag.split("+")
  tag_string = "(%s)" % ",".join(["'%s'" % tag for tag in tags])

  sql = """\
SELECT `hanzi`, `pinyin`, `english`, `part_of_speech`
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
