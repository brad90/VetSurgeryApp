require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal')
require_relative('../models/staff')
require_relative('../models/visit')
also_reload('./models/*')
require( 'pry-byebug' )



#Animal CRUD

#Show me all the animals
get'/animals'do
  @animals = Animal.all
  @visits = Visit.all
erb(:'animals/index')
end

#Animal Create new animal
get '/animals/new' do
  @staff = Staff.all()
  erb(:'animals/new')
end

#Save new animal
post '/animals' do
  @animals = Animal.new(params)
  @animals.save()
  redirect to '/animals'
end




#Animal Update info
get '/animals/:id/edit' do
  @staff = Staff.all
  @animal = Animal.find(params[:id])
  erb(:'animals/edit')
end

#Animal show one animal
get '/animals/:id' do
  @animal = Animal.find(params[:id])
  @animal_visits = @animal.visits
erb(:'animals/show')
end

#Animal show one animal
get '/animals/find' do
erb(:'animals/find_existing')
end

#Animal save updates
post '/animals/:id' do
  animal = Animal.new(params)
  animal.update
  redirect to "/animals"
end

#Animal save updates
post '/animals/:id/delete' do
  animal = Animal.new(params)
  animal.delete
  redirect to "/animals"
end

post '/animals/:id/check_out' do
  animals = Animal.new(params)
  animals.check_out
  redirect to "/animals"
end
