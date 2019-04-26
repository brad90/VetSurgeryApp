require_relative('../db/sqlrunner.rb')


class Animal
  attr_reader :name, :dob, :type_of_animal, :treatment_notes, :id
  attr_accessor :owner_email,:owner_phone_number, :assigned_vet

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @dob = options['dob']
    @type_of_animal = options['type_of_animal']
    @owner_email = options['owner_email']
    @owner_phone_number = options['owner_phone_number']
    @treatment_notes = options['treatment_notes']
    @assigned_vet = options['assigned_vet']
  end


  #save - create new animal in vet
  def save()
    sql ="INSERT INTO animals
    (
      name,
      dob,
      type_of_animal,
      owner_email,
      owner_phone_number,
      treatment_notes,
      assigned_vet
    )VALUES(
      $1,
      $2,
      $3,
      $4,
      $5,
      $6,
      $7) RETURNING id"
    values = [@name, @dob, @type_of_animal, @owner_email,
      @owner_phone_number, @treatment_notes, @assigned_vet]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id']
  end

  def update
    sql = "UPDATE animals SET (name, dob, type_of_animal,
    owner_email, owner_phone_number, treatment_notes, assigned_vet)
    = ($1, $2, $3, $4, $5, $6, $7) WHERE id = $8"
    values = [@name, @dob, @type_of_animal, @owner_email,
    @owner_phone_number, @treatment_notes, @assigned_vet, @id]
    SqlRunner.run(sql,values)
  end
  #
  def delete()
    sql = "DELETE FROM animals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM animals WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    animal = Animal.new(result)
    return animal
  end

  def self.map_items(animal_data)
    return animal_data.map{|data| Animal.new(data)}
  end

  def self.all()
    sql = "SELECT * FROM animals"
    result = SqlRunner.run(sql)
    animal_list = map_items(result)
    return animal_list
  end

end
