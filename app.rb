require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/pets_controller')
require_relative('controllers/vets_controller')

#404 Error! - Not Found
not_found do
  @title = "Nothing to see here... move along please"
  erb(:oops)
end

# index - GET LISTS ALL
get '/' do
  @title = "Acorn Vet Practice"
  erb( :index )
end
