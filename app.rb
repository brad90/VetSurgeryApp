require( 'sinatra' )
require_relative('controllers/vet_surgery_animal_controller.rb')
require_relative('controllers/vet_surgery_staff_controller.rb')
require_relative('controllers/vet_surgery_visits_controller.rb')

get '/' do
  erb( :index )
end
