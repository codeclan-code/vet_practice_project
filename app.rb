require('sinatra')
require('sinatra/contrib/all')
require_relative('models/pet')
require_relative('models/vet')
also_reload('./models/*')

#404 - Not Found
# 404 Error!
# error Sinatra::NotFound do
#   @title = "Nothing here... move along please"
#   erb :oops, :layout => :page404
# end

# index - GET LISTS ALL
get '/' do
  @title = "Acorn Vet Practice"
  erb( :index )
end

# PETS ADD, UPDATE, LIST, DELETE
# show - GET FIND BY ID

# new - GET NEW ORDER FORM

# create - POST FORM TO CREATE

# edit - GET FORM BY ID TO EDIT

# update - POST FORM AFTER EDIT

# destroy - POST ID DELETE
