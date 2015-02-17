require 'pg'

conn = PG.connect( 
  dbname: 'feb2015',
  host: 'localhost',
  port: 5432
)

pets = []
conn.exec( "SELECT * FROM pets;" ) do |records|
  records.each do |record|
    pets << Pet.new(record)
  end
end


class Pet

  attr_reader :id, :name, :attack_power, :age, :breed

  def initialize(fields)
    puts "in initialize"
  end

end

