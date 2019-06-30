require('sinatra')
# require('sinatra/contrib/all')
require_relative('../models/animal')
require_relative('../models/staff')
require_relative('../models/visit')
# also_reload('./models/*')
# require( 'pry-byebug' )



#Animal CRUD

#Show me all the animals
get'/'do
  @animals = Animal.all
  @visits = Visit.all
erb(:'/index')
end

get'/registered_animals'do
  @animals = Animal.all
erb(:'animals/index_registered_animals')
end

#Animal Create new animal
get '/new_animal' do
  @staff = Staff.all()
  erb(:'animals/new_animal')
end

#Save new animal
post '/' do
  @animals = Animal.new(params)
  @animals.save()
  redirect to '/registered_animals'
end

#Animal show one animal
get '/registered_animals/:id' do
  @animal = Animal.find(params[:id])
  @animal_visits = @animal.visits
erb(:'animals/show')
end

#Animal Update info
get '/registered_animals/:id/edit' do
  @staff = Staff.all
  @animal = Animal.find(params[:id])
  erb(:'animals/edit')
end




#Animal show one animal
get '/find' do
erb(:'animals/find_existing')
end

#Animal save updates
post '/:id' do
  animal = Animal.new(params)
  animal.update
  redirect to "/registered_animals"
end


#Animal delete
post '/:id/delete' do
  animal = Animal.new(params)
  animal.delete
  redirect to "/registered_animals"
end

post '/:id/check_out' do
  animals = Animal.new(params)
  animals.check_out_animal_from_hospital
  redirect to "/"
end
