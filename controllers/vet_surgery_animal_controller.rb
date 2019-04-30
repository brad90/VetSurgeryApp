require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal')
require_relative('../models/staff')
also_reload('./models/*')
require( 'pry-byebug' )



#Animal CRUD

#Show me all the animals
get'/vet-surgery/animals'do
  @animals = Animal.all
erb(:index)
end

#Animal Create new animal
get '/vet-surgery/animals/new' do
  @staff = Staff.all()
  erb(:new)
end

#Save new animal
post '/vet-surgery/animals' do
  @animals = Animal.new(params)
  @animals.save()
  @animals.add_visit
  redirect to '/vet-surgery/animals'
end

#Animal Update info
get '/vet-surgery/animals/:id/edit' do
  @staff = Staff.all
  @animal = Animal.find(params['id'])
  erb(:edit)
end

#Animal show one animal
get '/vet-surgery/animals/:id' do
  @animal = Animal.find(params['id'])

  @animal_visits = @animal.visits
erb(:show)
end

#Animal show one animal
get '/vet-surgery/animals/find' do
erb(:find_existing)
end

#Animal save updates
post '/vet-surgery/animals/:id' do
  animal = Animal.new(params)
  animal.update
  redirect to "/vet-surgery/animals/#{params['id']}"
end

#Animal save updates
post '/vet-surgery/animals/:id/delete' do
  animal = Animal.new(params)
  animal.delete
  redirect to "/vet-surgery/animals"
end
