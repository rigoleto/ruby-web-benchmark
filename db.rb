require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDOUT)


jruby = defined?(JRUBY_VERSION)

connection = ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'web_benchmark',
  username: 'postgres',
  password: 'postgres',
  pool: 50,
  timeout: 2000
)

conn = ActiveRecord::Base.connection

conn.execute 'DROP TABLE IF EXISTS messages'
conn.execute <<CREATE_TABLE
  CREATE TABLE messages(
    id INTEGER PRIMARY KEY,
    message TEXT
  );
CREATE_TABLE
