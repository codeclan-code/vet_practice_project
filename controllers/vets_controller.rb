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

get '/vets' do
  @title = "Vet's Schedule"
  erb(:"vets/index")
end

get '/vets/list' do # index
  @pets = Pet.all()
  @title = "Vet's Schedule"
  erb (:"vets/index"), :layout => (:"vets/vets_layout")
end



# VET CRUD VET CRUD VET CRUD VET CRUD VET CRUD

get '/vets_list' do # index
  @vets = Vet.all()
  @title = "List of Vets"
  erb(:"vets/list")
end

# PETS ADD, UPDATE, LIST, DELETE
# show - GET FIND BY ID

# new - GET NEW PET ORDER FORM
get '/vets/new' do # new
  # @vet = Vet.all()
  @title = "Add a New Vet"
  erb( :"vets/new" )
end

# create - POST FORM TO CREATE
post '/vets' do # create
  @vet = Vet.new( params )
  @vet.save()
  @title = "#{@vet.name} has been Added"
  erb( :"vets/create" )
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

get '/vets/:id' do # index
  @pets = Pet.vetspets(params['id'])
  @title = "Pet Vet Details"
  erb (:"vets/vet_list"), :layout => (:"vets/vets_layout")
end
