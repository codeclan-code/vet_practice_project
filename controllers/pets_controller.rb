require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/pet.rb' )
require_relative( '../models/vet.rb' )
require_relative( '../models/pettype.rb' )
require_relative( '../models/owner.rb' )
also_reload( '../models/*' )

get '/pets' do # index
  @pets = Pet.all()
  @title = "List of Pets"
  erb(:"pets/list")
end

get '/pets/new' do # new
  @pet_types = PetType.all()
  @pets = Pet.all()
  @vets = Vet.all()
  @owners = Owner.all()
  @title = "Register a New Pet"
  erb( :"pets/new" )
end

post '/pets' do # create
  @pet = Pet.new( params )
  @pet.save()
  @title = "#{@pet.name} has been Registered"
  erb( :"pets/create" )
end

get '/pets/:id' do
  @pet = Pet.find(params['id'])
  @title = "Pet Details"
  erb(:"pets/show")
end

get '/pets/:id/edit' do
  @vets = Vet.all
  @owners = Owner.all()
  @pettype = PetType.all
  @pet = Pet.find(params['id'])
  @title = "Edit Pet Details"
  erb(:"pets/edit")
end

post '/pets/:id' do
  pet = Pet.new(params)
  pet.update
  @title = "Update Pet Details"
  redirect to "/pets/#{params['id']}"
end

post '/pets/:id/delete' do
  pet = Pet.find(params['id'])
  pet.delete
  @title = "Delete Pet Details"
  redirect to '/pets'
end
