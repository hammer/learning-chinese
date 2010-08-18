To recreate create_tables.sql:
     $ mysqldump -d learning_chinese

To set up the MySQL instance:

     $ mysql < create_database.sql
     $ mysql learning_chinese < create_tables.sql
