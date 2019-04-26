require_relative('../db/sqlrunner.rb')
require( 'pry-byebug' )

class Staff
  attr_reader :first_name, :id
  attr_accessor :last_name

  def initialize(first_name, last_name)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    # @job_title = options['job_title']
    # @salary = options['salary'].to_i
    # @phone_number = options['phone_number']
  end


  #CRUD


    #save - create new staff member
    def save()
      sql="INSERT INTO staff(first_name, last_name)
      VALUES ($1, $2, $3, $4, $5) RETURNING id "
      values=[@first_name, @last_name]
      result = SqlRunner.run(sql, values)
      @id = result[0]['id']
    end

   #update - update staff memembers details

   def update()
     sql = "UPDATE staff SET (first_name,last_name) = ($1,$2) WHERE id = $3"
     values = [@first_name, @last_name, @id]
     SqlRunner.run(sql,values)
   end

   #delete

   def delete()
     sql = "DELETE FROM staff WHERE id = $1"
     values = [@id]
     SqlRunner.run(sql,values)
   end

   #find(id)

   def self.find(id)
     sql = "SELECT * FROM staff WHERE id = $1"
     values = [id]
     result = SqlRunner.run(sql,values)
     staff_member = Staff.new(result)
     return staff_member
   end

   #delete_all

   def self.delete_all
     sql = "DELETE * FROM staff"
     SqlRunner.run(sql)
   end

   #all
   def self.all()
    sql = "SELECT * FROM staff"
    staff_member = SqlRunner.run(sql)
    staff = map_items(staff_member)
    p staff
   end

   def self.map_items(staff_data)
     return staff_data.map{|staff| Vet.new(staff)}
   end


end
