require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal')
require_relative('../models/staff')
also_reload('./models/*')
require( 'pry-byebug' )

#Staff Show all
get'/visits' do
  @visits = Visit.all()
  erb(:'bookings/index')
end

#Staff create new staff
get '/visits/new' do
  erb(:'bookings/new')
end

#Staff save new staff
post '/visits' do
  @visits = Visit.new(params)
  @visits.save()
  redirect to '/staffs'
end

#Show only one vets information in the vets
get '/visits/:id/edit' do
  @visit = Visit.find(params[:id])
erb(:'bookings/edit')
end

#Show only one vets information in the vets
get '/visits/:id' do
  @visit = Visit.find(params[:id])
  @animals = Animal.all()
erb(:'bookings/show')
end

#Staff save updates
post'/visits/:id' do
  @visit = Visit.new(params)
  @visit.update
  redirect to "/visits"
end

#Delete Staff

post '/visits/:id/delete' do
  staff = Visit.new(params)
  staff.delete()
  redirect to '/visits'
end
