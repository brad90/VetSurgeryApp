require( 'sinatra' )
require_relative('controllers/vet_surgery_animal_controller.rb')
require_relative('controllers/vet_surgery_staff_controller.rb')
require_relative('controllers/vet_surgery_visits_controller.rb')
require('pg')

get'/' do
  erb( :'/views/index/index' )
end
