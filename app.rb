require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/pets_controller')

#404 Error! - Not Found
error Sinatra::NotFound do
  @title = "Nothing to see here... move along please"
  #   erb :oops, :layout => :page404
  # How does it work across routes>??????
  erb(:oops)
end

# index - GET LISTS ALL
get '/' do
  @title = "Acorn Vet Practice"
  erb( :index )
end
