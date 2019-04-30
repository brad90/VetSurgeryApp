require_relative("../models/animal.rb")
require_relative("../models/staff.rb")
require_relative("../models/visit.rb")
require( 'pry-byebug' )

Animal.delete_all
Staff.delete_all
Visit.delete_all

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
  'type_of_animal'=>'dog',
  'owner_name' =>'Mrs Alison Bradley',
  'owner_email' => 'alison.bradley@gmail.com',
  'owner_phone_number'=>'07903080152',
  'assigned_vet' => vet1.id,
  'treatment_notes'=> 'This dog is loves Dolly Parton',
  'check_in' => '2019-07-22',
  'check_out' => 'idfhskjhf'
  })

animal2 = Animal.new({
  'name'=>'Max',
  'dob' => '12/3/18',
  'type_of_animal'=>'dog',
  'owner_name' =>'Mr Bob Smith',
  'owner_email' => 'bob.smith@gmail.com',
  'owner_phone_number'=>'4291',
  'assigned_vet' => vet1.id,
  'treatment_notes'=> 'This dog is loves Dolly Parton',
  'check_in' => '1232142ou19',
  'check_out' => 'idfhskjhf'
  })

animal3 = Animal.new({
  'name'=>'kitty',
  'dob' => '21/8/12',
  'type_of_animal'=>'cat',
  'owner_name' =>'Mrs Sandra Bulloch',
  'owner_email' => 'sandra90@gmail.com',
  'owner_phone_number'=>'07903080152',
  'assigned_vet' => vet2.id,
  'treatment_notes'=> 'This dog is loves Dolly Parton',
  'check_in' => '1232142ou19',
  'check_out' => 'idfhskjhf'
  })

  animal4 = Animal.new({
    'name'=>'kitty',
    'dob' => '21/8/12',
    'type_of_animal'=>'cat',
    'owner_name' =>'Mrs Sandra Bulloch',
    'owner_email' => 'sandra90@gmail.com',
    'owner_phone_number'=>'07903080152',
    'assigned_vet' => vet2.id,
    'treatment_notes'=> 'This dog is loves Dolly Parton',
    'check_in' => '1232142ou19',
    'check_out' => ''
    })




animal1.save
animal2.save
animal3.save
animal4.save


visit1 = Visit.new({
  'animal_id' => animal1.id,
  'check_in' => '12/02/14',
  'check_out' => '15/02/14',
  'treatment_notes' => 'Dog is sick from cat flu'
  })

visit2 = Visit.new({
  'animal_id' => animal2.id,
  'check_in' => '12/03/14',
  'check_out' => '15/03/14',
  'treatment_notes' => 'Dog is sick from cat flu'
  })

visit3 = Visit.new({
  'animal_id' => animal3.id,
  'check_in' => '12/03/14',
  'check_out' => '15/03/14',
  'treatment_notes' => 'Dog is sick from cat flu'
  })

visit4 = Visit.new({
  'animal_id' => animal3.id,
  'check_in' => '12/06/14',
  'check_out' => '15/06/14',
  'treatment_notes' => 'The dog swallowed a lego brick'
  })

  visit5 = Visit.new({
    'animal_id' => animal4.id,
    'check_in' => '12/06/14',
    'check_out' => 'sffgdf ',
    'treatment_notes' => 'The dog swallowed a lego brick'
    })

visit1.save
visit2.save
visit3.save
visit4.save
visit5.save


Visit.all






binding.pry
nil
