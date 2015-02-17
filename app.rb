require 'pg'

class Pet

  attr_reader :id, :name, :attack_power, :age, :breed

  def initialize(fields)
    @id = fields['id']
    @name = fields['name']
    @attack_power = fields['attack_power']
    @age = fields['age']
    @breed = fields['breed']
  end

end

def connection
  conn = PG.connect( 
    dbname: 'feb2015',
    host: 'localhost',
    port: 5432
  )
end

def get_pets
  pets = []
  connection.exec( "SELECT * FROM pets;" ) do |records|
    records.each do |record|
      p = Pet.new(record)
      puts p.inspect
      pets << p
    end
  end
end

get_pets



