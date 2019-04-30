require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal')
require_relative('../models/staff')
also_reload('./models/*')

#Staff Show all
get'/staffs' do
  @staff = Staff.all()
  erb(:'staffs/index')
end

#Staff create new staff
get '/staffs/new' do
  erb(:'staffs/new')
end

#Staff save new staff
post '/staffs' do
  @staff = Staff.new(params)
  @staff.save()
  redirect to '/staffs'
end

#Show only one vets information in the vets
get '/staffs/:id/edit' do
  @staff = Staff.find(params[:id])
  @animals = Animal.all()
erb(:'staffs/edit')
end

#Show only one vets information in the vets
get '/staffs/:id' do
  @staff = Staff.find(params[:id])
  @animals = Animal.all()
erb(:'staffs/show')
end

#Staff save updates
post'/staffs/:id' do
  @staff = Staff.new(params)
  @staff.update
  redirect to "/staffs"
end

#Delete Staff

post '/staffs/:id/delete' do
  staff = Staff.new(params)
  staff.delete()
  redirect to '/staffs'
end
