require('sinatra')
require('sinatra/contrib/all')
require_relative('models/animal')
require_relative('models/staff')
also_reload('./models/*')



#Show all animals in the vets
get'/vet-surgery'do
  @animals = Animal.all
erb(:index)
end

#Show only one animals information in the vets
get '/vet-surgery/new' do
  @animal = Animal.new()
erb(:new)
end






#Show only one animals information in the vets
get '/animals/:id' do
  @animal = Animal.find(params[:id])
erb(:show)
end
