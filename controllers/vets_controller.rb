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

get '/vets/new' do # new
  @vets = Vet.all()
  @title = "Add a New Vet"
  erb( :"vets/new" )
end

post '/vets' do # create
  @vet = Vet.new( params )
  @vet.save()
  @title = "#{@vet.name} has been Added"
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
  erb (:"vets/index")
end

get '/vets/warning' do # index
  @title = "List of Vets"
  erb(:"vets/warning")
end

get '/vets/:id/edit' do
  @vet = Vet.find(params['id'])
  @title = "Edit Vet Details"
  erb(:"vets/edit")
end

get '/vets/:id' do
  @vet = Vet.find(params['id'])
  @title = "Vet Details"
  erb(:"vets/show")
end

post '/vets/:id' do
  vet = Vet.new(params)
  vet.update
  @title = "Update Pet Details"
  redirect to "/vets/#{params['id']}"
end

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
  erb (:"vets/vet_list")
end
