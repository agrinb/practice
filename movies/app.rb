require 'pg'

def db_connection
  begin
    connection = PG.connect(dbname: 'movies')

    yield(db_connection do |conn|
  conn.exec('SELECT * FROM genres')
end
)

  ensure
    connection.close
  end
end
