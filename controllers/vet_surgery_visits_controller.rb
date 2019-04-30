require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/visit.rb')
require_relative('../models/staff.rb')
require_relative('../models/animal.rb')
also_reload('./models/*')


#Booking CRUD

#Show me all the animals
get '/visits' do
  @visits = Visit.all
erb(:'bookings/index')
end

# #Animal Create new animal
# get '/vet-surgery/animals/new' do
#   @staff = Staff.all()
#   erb(:'booking/new')
# end

# #Save new visit
# post '/vet-surgery/visits' do
#   @visit = Visit.new(params)
#   @visit.save()
#   redirect to '/vet-surgery/animals'
# end
#
# #Save a new visit
# post '/vet-surgery/animals/booking' do
#   @Visit = Visit.new(params)
#   @Visit.save()
#   redirect to '/vet-surgery/animals'
# end
#
# #Animal Update info
# get '/vet-surgery/animals/:id/edit' do
#   @staff = Staff.all
#   @animal = Animal.find(params['id'])
#   erb(:'animals/edit')
# end
#
# #Animal show one animal
# get '/vet-surgery/animals/:id' do
#   @animal = Animal.find(params['id'])
#
#   @animal_visits = @animal.visits
# erb(:'animals/show')
# end
#
# #Animal show one animal
# get '/vet-surgery/animals/find' do
# erb(:'animals/find_existing')
# end
#
# #Animal save updates
# post '/vet-surgery/animals/:id' do
#   animal = Animal.new(params)
#   animal.update
#   redirect to "/vet-surgery/animals/#{params['id']}"
# end
#
# #Animal save updates
# post '/vet-surgery/animals/:id/delete' do
#   animal = Animal.new(params)
#   animal.delete
#   redirect to "/vet-surgery/animals"
# end
