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
  # @pets = Pet.all()
  # @pettype = PetType.all
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

get '/vets/:id' do # index
  @pets = Pet.vetspets(params['id'])
  @title = "Pet Vet Details"
  erb (:"vets/vet_list"), :layout => (:"vets/vets_layout")
end
