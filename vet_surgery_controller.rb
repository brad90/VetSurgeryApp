require('sinatra')
require('sinatra/contrib/all')
require_relative('models/animal')
require_relative('models/staff')
also_reload('./models/*')



#Animals Index
get'/vet-surgery'do
  @animals = Animal.all
erb(:index)
end

#Staff Index
get'/vet-surgery/staff'do
  @staff = Staff.all
erb(:staff_index)
end

#Animal Create new animal
get '/vet-surgery/new' do
  @staff = Staff.all()
  erb(:new)
end

#Staff create new staff memeber
get '/vet-surgery/new_staff' do
  erb(:new_staff)
end

#Animal save new animal to db
post '/vet-surgery' do
  @animals = Animal.new(params)
  @animals.save()
  redirect to '/vet-surgery'
end

#Staff save new animal to db

post '/vet-surgery/staff' do
  @staff = Staff.new(params)
  @staff.save()
  redirect to '/vet-surgery/staff'
end

#Animal save new animal to db

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

post '/vet-surgery/:id' do
  animal = Animal.new(params)
  animal.update
  redirect to "/vet-surgery/#{params['id']}"
end

#Show only one vets information in the vets
get '/vet-surgery/staff/:id' do
  @Staff = Staff.find(params[:id])
erb(:show)
end

post '/vet-surgery/:id/delete' do
  animal = Animal.find(params['id'])
  animal.delete
  redirect to '/vet-surgery'
end
