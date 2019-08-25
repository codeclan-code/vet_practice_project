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

# GET PET BY ID TO EDIT
get '/vets/:id' do
  @vet = Vet.find(params['id'])
  @title = "Vet Details"
  erb(:"vets/show")
end

get '/vets/:id/edit' do
  @vet = Vet.find(params['id'])
  @title = "Edit Vet Details"
  erb(:"vets/edit")
end


# update - POST FORM AFTER EDIT
post '/vets/:id' do
  vet = Vet.new(params)
  vet.update
  @title = "Update Vet Details"
  redirect to "/vets/#{params['id']}"
end

# destroy - POST ID DELETE
post '/vets/:id/delete' do
  vet = Vet.find(params['id'])
  vet.delete
  @title = "Delete Vet Details"
  redirect to '/vets'
end

# EXTRAS

get '/vets/schedule' do # index
  @pets = Pet.all()
  @title = "Vet's Schedule"
  erb (:"vets/index"), :layout => (:"vets/vets_layout")
end

get '/vets/pets/:id' do # index
  @pets = Pet.vetspets(params['id'])
  @title = "Pet Vet Details"
  erb (:"vets/vet_list"), :layout => (:"vets/vets_layout")
end

get '/vets/admin' do # index
  @vets = Vet.all()
  @title = "List of Vets"
  erb(:"vets/list")
end
