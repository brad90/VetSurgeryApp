require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal')
require_relative('../models/staff')
also_reload('./models/*')

#Staff Show all
get'/vet-surgery/staff' do
  @staff = Staff.all()
  erb(:staff_index)
end

#Staff create new staff
get '/vet-surgery/staff/new_staff' do
  erb(:new_staff)
end

#Staff save new staff
post '/vet-surgery/staff' do
  @staff = Staff.new(params)
  @staff.save()
  redirect to '/vet-surgery/staff'
end

#Show only one vets information in the vets
get '/vet-surgery/staff/:id' do
  @staff = Staff.find(params[:id])
  @animals = Animal.all()
erb(:show_staff)
end

#Show only one vets information in the vets
get '/vet-surgery/staff/:id/edit' do
  @staff = Staff.find(params[:id])
  @animals = Animal.all()
erb(:update_staff)
end

#Staff save updates
post '/vet-surgery/staff/:id' do
  staff = Staff.new(params)
  staff.update
  redirect to "/vet-surgery/staff/#{params[:id]}"
end

#Delete Staff

post '/vet-surgery/staff/:id/delete' do
  staff = Staff.find(params['id'])
  staff.delete()
  redirect to '/vet-surgery/staff'
end
