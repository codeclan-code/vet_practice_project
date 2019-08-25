require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/pet.rb' )
require_relative( '../models/vet.rb' )
require_relative( '../models/pettype.rb' )
also_reload( '../models/*' )

#404 Error! - Not Found
not_found do
  @title = "Nothing to see here... move along please"
  erb(:oops)
end

get '/pets' do # index
  @pets = Pet.all()
  @title = "List of Pets"
  erb(:"pets/list")
end

# PETS ADD, UPDATE, LIST, DELETE
# show - GET FIND BY ID

# new - GET NEW PET ORDER FORM
get '/pets/new' do # new
  @pet = Pet.all()
  @title = "Register a New Pet"
  erb( :"pets/new" )
end

# create - POST FORM TO CREATE
post '/pets' do # create
  @pet = Pet.new( params )
  @pet.save()
  @title = "#{@pet.name} has been Registered"
  erb( :"pets/create" )
end

# edit - GET FORM BY ID TO EDIT
get '/pets/:id' do
  @pet = Pet.find(params['id'])
  @title = "Pet Details"
  erb(:"pets/show")
end

get '/pets/:id/edit' do
  @vets = Vet.all
  @pettype = PetType.all
  @pet = Pet.find(params['id'])
  @title = "Edit Pet Details"
  erb(:"pets/edit")
end

# update - POST FORM AFTER EDIT
post '/pets/:id' do
  pet = Pet.new(params)
  pet.update
  @title = "Update Pet Details"
  redirect to "/pets/#{params['id']}"
  # redirect to confrmation page
end

# destroy - POST ID DELETE
post '/pets/:id/delete' do
  pet = Pet.find(params['id'])
  pet.delete
  @title = "Delete Pet Details"
  redirect to '/pets'
end
