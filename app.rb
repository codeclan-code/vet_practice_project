require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/pet')
require_relative('./models/vet')
also_reload('./models/*')

#404 Error! - Not Found
# error Sinatra::NotFound do
#   @title = "Nothing to see here... move along please"
#   erb :oops, :layout => :page404
# end

# index - GET LISTS ALL
get '/' do
  @title = "Acorn Vet Practice"
  erb( :index )
end

get '/pets' do # index
  @pets = Pet.all()
  erb( :list )
end

# PETS ADD, UPDATE, LIST, DELETE
# show - GET FIND BY ID


# new - GET NEW PET ORDER FORM
get '/pets/new' do # new
  @title = "Register a New Pet"
  erb( :new )
end

# create - POST FORM TO CREATE
post '/pets' do # create
  @pet = Pet.new( params )
  @pet.save()
  @title = "#{@pet.name} Pet Registered"
  erb( :create )
end

# edit - GET FORM BY ID TO EDIT

# update - POST FORM AFTER EDIT

# destroy - POST ID DELETE
