require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/pet.rb' )
require_relative( '../models/vet.rb' )
require_relative( '../models/pettype.rb' )
require_relative( '../models/owner.rb' )
also_reload( '../models/*' )

get '/vets' do # index
  @vets = Vet.all()
  @title = "List of Vets"
  erb(:"vets/list")
end

# new - GET NEW VET FORM
get '/vets/new' do # new
  @vets = Vet.all()
  @title = "Add a New Vet"
  erb( :"vets/new" )
end

# create - POST FORM TO CREATE
post '/vets' do # create
  @vet = Vet.new( params )
  @vet.save()
  # @title = "#{@vet.name} has been Added"
  erb( :"vets/create" )
end

get '/vets/admin' do # index
  @vets = Vet.all()
  @title = "List of Vets"
  erb(:"vets/list")
end

get '/vets/schedule' do # index
  @vets = Vet.all()
  @pets = Pet.all()
  @title = "Vet's Schedule"
  # erb (:"vets/index"), :layout => (:"vets/vets_layout")
  erb (:"vets/index")
end


get '/vets/:id/edit' do
  @vet = Vet.find(params['id'])
  @title = "Edit Vet Details"
  erb(:"vets/edit")
end

# GET PET BY ID TO EDIT
get '/vets/:id' do
  @vet = Vet.find(params['id'])
  @title = "Vet Details"
  erb(:"vets/show")
end

# update - POST FORM AFTER EDIT
post '/vets/:id' do
  vet = Vet.new(params)
  vet.update
  # @title = "Update Pet Details"
  redirect to "/vets/#{params['id']}"
  # redirect to confrmation page
end

# destroy - POST ID DELETE
post '/vets/:id/delete' do
  vet = Vet.find(params['id'])
  vet.delete
  @title = "Delete Vet Details"
  redirect to '/vets'
end

# EXTRAS

get '/vets/pets/:id' do # index
  @pets = Pet.vetspets(params['id'])
  @vets = Vet.all()
  @title = "Pet Vet Details"
  # erb (:"vets/vet_list"), :layout => (:"vets/vets_layout")
  erb (:"vets/vet_list")
end
