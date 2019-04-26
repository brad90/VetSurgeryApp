require_relative("../models/animal.rb")
require_relative("../models/staff.rb")

Animal.delete_all

animal1 = Animal.new({
  'name'=>'Bob',
  'dob' => '12/3/13',
  'type_of_animal'=> 'dog',
  'owner_email' => 'alison.bradley@gmail.com',
  'owner_phone_number'=>'07903080152',
  'treatment_notes'=> 'the dog has been saved from fleas'
  })

animal1.save
