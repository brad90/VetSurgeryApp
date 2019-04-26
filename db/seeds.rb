require_relative("../models/animal.rb")
require_relative("../models/staff.rb")
require( 'pry-byebug' )

Animal.delete_all
Staff.delete_all

vet1 = Staff.new({
  'first_name' => 'Janet',
  'last_name' => 'Goodbody'
  })

vet2 = Staff.new({
  'first_name' => 'Eric',
  'last_name' => 'White'
  })

vet1.save
vet2.save

animal1 = Animal.new({
  'name'=>'Bob',
  'dob' => '12/3/13',
  'type_of_animal'=> 'dog',
  'owner_email' => 'alison.bradley@gmail.com',
  'owner_phone_number'=>'07903080152',
  'treatment_notes'=> 'the dog has been saved from fleas',
  'assigned_vet' => vet1.id
  })

animal2 = Animal.new({
  'name'=>'Max',
  'dob' => '12/3/18',
  'type_of_animal'=> 'dog',
  'owner_email' => 'bob.smith@gmail.com',
  'owner_phone_number'=>'4291',
  'treatment_notes'=> 'the dog has been treated for smelly breath',
  'assigned_vet' => vet1.id
  })

animal3 = Animal.new({
  'name'=>'kitty',
  'dob' => '21/8/12',
  'type_of_animal'=> 'cat',
  'owner_email' => 'sandra90@gmail.com',
  'owner_phone_number'=>'07903080152',
  'treatment_notes'=> 'the cat has had a check up',
  'assigned_vet' => vet2.id
  })


animal1.save
animal2.save
animal3.save






binding.pry
nil
