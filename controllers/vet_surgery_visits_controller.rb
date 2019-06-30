require('sinatra')
# require('sinatra/contrib/all')
require_relative('../models/animal')
require_relative('../models/staff')
require_relative('../models/visit')
# also_reload('./models/*')
# require( 'pry-byebug' )

#Staff Show all
get'/visits' do
  @visits = Visit.all()
  erb(:'visits/index')
end

#Staff create new booking
get '/visits/new' do
  @animals = Animal.all
  erb(:'visits/new')
end

#Staff save new booking
post '/visits' do
  @visits = Visit.new(params)
  @visits.save()
  redirect to '/visits'
end

#Show only one vets information in the vets
get '/visits/:id/edit' do
  @animals = Animal.all()
  @visit = Visit.find(params[:id])
erb(:'visits/edit')
end



#Show only one vets information in the vets
get '/visits/:id' do
  @visit = Visit.find(params[:id])
  @animals = Animal.all()
erb(:'visits/show')
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
