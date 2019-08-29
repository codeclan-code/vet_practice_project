require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/pets_controller')
require_relative('controllers/vets_controller')
require_relative('controllers/owners_controller')

#404 Error! - Not Found
not_found do
  @title = "Nothing to see here... move along please"
  erb :oops, :layout => (:"home_layout")
end

#Use non default home_layout
get '/' do
  @title = "Blue Cat Vet Practice"
    erb :index, :layout => (:"home_layout")
end






# 
