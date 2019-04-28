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

#Show all the staff currently working
get'/vet-surgery/staff'do
  @staff = Staff.all
erb(:staff_index)
end

#Get the information to create a new Animal
get '/vet-surgery/new' do
  @staff = Staff.all()
  erb(:new)
end

#Get the information to create a new Staff
get '/vet-surgery/new_staff' do
  erb(:new_staff)
end

post '/vet-surgery' do
  @animals = Animal.new(params)
  @animals.save()
  redirect to '/vet-surgery'
end

post '/vet-surgery/staff' do
  @staff = Staff.new(params)
  @staff.save()
  redirect to '/vet-surgery/staff'
end

get '/vet-surgery/:id/edit' do
  @staff = Staff.all
  @animal = Animal.find(params['id'])
  erb(:edit)
end


#Show only one animals information in the vets
get '/vet-surgery/:id' do
  @animal = Animal.find(params[:id])
erb(:show)
end

#Show only one vets information in the vets
get '/vet-surgery/staff/:id' do
  @Staff = Staff.find(params[:id])
erb(:show)
end
