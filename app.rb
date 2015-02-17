require 'pg'

class Pet

  attr_reader :id
  attr_accessor :name, :attack_power, :age, :breed

  def initialize(fields)
    @id = fields['id']
    @name = fields['name']
    @attack_power = fields['attack_power']
    @age = fields['age']
    @breed = fields['breed']
  end

  def self.connection
    conn = PG.connect( 
      dbname: 'feb2015',
      host: 'localhost',
      port: 5432
    )
  end

  def self.all
    pets = []
    connection.exec( "SELECT * FROM pets;" ) do |records|
      records.each do |record|
        p = Pet.new(record)
        pets << p
      end
    end
    pets
  end

end

pets = Pet.all
puts pets.inspect

p = pets.first
# OPTION 1
p.update(name: 'KDawg', breed: 'Cool Pup')
# OPTION 2 (shitty)
p.update_breed('Cool Pup')
# OPTION 3
p.name  = 'KDawg' # @name
p.breed = 'Cool Pup' # @breed
p.save # => UPDATE

# UPDATE pets SET name = 'KDawg' WHERE id = @id




