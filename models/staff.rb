require_relative('../db/sqlrunner.rb')


class Staff
  attr_reader :first_name, :id
  attr_accessor :last_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    # @job_title = options['job_title']
    # @salary = options['salary'].to_i
    # @phone_number = options['phone_number']
  end



  def save()
    sql ="INSERT INTO staffs
    (
    first_name,
    last_name
    )
    VALUES
    (
    $1,
    $2
    ) RETURNING id"
      values = [@first_name, @last_name]
      results = SqlRunner.run(sql, values)
      @id = results[0]['id']
    end

    def update
      sql = "UPDATE staffs SET (first_name,last_name)
      = ($1, $2) WHERE id = $3"
      values = [@first_name, @last_name, @id]
      SqlRunner.run(sql,values)
    end

    def delete()
      sql = "DELETE FROM staffs WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.delete_all()
      sql = "DELETE FROM staffs"
      SqlRunner.run(sql)
    end

    def self.find(id)
      sql = "SELECT * FROM staffs WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql, values).first
      animal = Staff.new(result)
      return animal
    end

    def self.map_items(staff_data)
      return staff_data.map{|data| Staff.new(data)}
    end

    def self.all()
      sql = "SELECT * FROM staffs"
      result = SqlRunner.run(sql)
      staff_list = map_items(result)
      return staff_list
    end

end
