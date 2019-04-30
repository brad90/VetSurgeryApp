require_relative('../db/sqlrunner.rb')

class Visit

  attr_reader :id, :pet_id, :check_in, :check_out
  attr_accessor :treatment_notes

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @animal_id = options['animal_id']
    @check_in = options['check_in']
    @check_out = options['check_out']
    @treatment_notes = options['treatment_notes']
  end


  def save()
    sql = "INSERT INTO visits
    (
      animal_id,
      check_in,
      check_out,
      treatment_notes
      )VALUES(
      $1,
      $2,
      $3,
      $4
     )RETURNING id"
    values = [@animal_id, @check_in, @check_out, @treatment_notes]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id']
  end


  def update()
    sql = "UPDATE visits SET
    (
      animal_id,
      check_in,
      check_out,
      treatment_notes
      )=(
      $1,
      $2,
      $3,
      $4
     )
     WHERE id = $5"
    values = [@animal_id, @check_in, @check_out, @treatment_notes, @id]
    SqlRunner.run(sql, values)
  end


  def delete()
    sql = "DELETE FROM visits WHERE id=$1"
    values=[@id]
    SqlRunner.run(sql, values)
  end


  def self.find(id)
    sql="SELECT * FROM visits WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values).first
    visit= Visit.new(results)
    return visit
  end


  def self.map_items(visits)
    return visits.map{|data|Visit.new(data)}
  end


  def self.delete_all()
    sql="DELETE FROM visits"
    SqlRunner.run(sql)
  end


  def self.all()
    sql = "SELECT * FROM visits"
    results = SqlRunner.run(sql)
    visit_list = map_items(results)
    return visit_list
  end

  def animal_name
    sql = "SELECT * FROM animals
            WHERE id = $1"
    values = [@animal_id]
    results = SqlRunner.run(sql,values)
    animal = results.map{|animal| Animal.new(animal)}.first
    return animal.name
  end

end
