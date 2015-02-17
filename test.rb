require 'pg'

conn = PG.connect( 
  dbname: 'feb2015',
  host: 'localhost',
  port: 5432
)

conn.exec( "SELECT * FROM pets;" ) do |records|
  records.each do |record|
    puts record['name'].inspect
  end
end