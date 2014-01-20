require "pg"
c = PGConn.new(host: "localhost", dbname: "testdb")
movies = c.exec "SELECT * FROM movies"
raring = 5
movies = c.exec_params "SELECT * FROM movies WHERE rating > $1", rating