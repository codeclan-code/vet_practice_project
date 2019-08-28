require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/pet.rb' )
require_relative( '../models/vet.rb' )
require_relative( '../models/pettype.rb' )
require_relative( '../models/owner.rb' )
also_reload( '../models/*' )

get '/owners' do # index
  @owners = Owner.all()
  @title = "List of Owners"
  erb(:"owners/list")
end

# # GET NEW PET FORM
get '/owners/new' do # new
  # @pet_types = PetType.all()
  # @pets = Pet.all()
  # @vets = Vet.all()
  @owners = Owner.all()
  @title = "Register a New Owner"
  erb( :"owners/new" )
end
#
# # POST FORM TO CREATE RECORD
post '/owners' do # create
  @owner = Owner.new( params )
  @owner.save()
  @title = "#{@owner.name} has been Registered"
  erb( :"owners/create" )
end

get '/owners/schedule' do # index
  @vets = Vet.all()
  @pets = Pet.all()
  @owners = Owner.all()
  @title = "Owner's Schedule"
  # erb (:"vets/index"), :layout => (:"vets/vets_layout")
  erb (:"owners/index")
end
#
# # GET PET BY ID TO EDIT
get '/owners/:id' do
  # @pet_types = PetType.all()
  # @pets = Pet.all()
  # @vets = Vet.all()
  @owner = Owner.find(params['id'])
  @title = "Owner Details"
  erb(:"owners/show")
end
#
get '/owners/:id/edit' do
  # @vets = Vet.all
  # @owners = Owner.all()
  # @pettype = PetType.all
  @owner = Owner.find(params['id'])
  @title = "Edit Owner Details"
  erb(:"owners/edit")
end
#
# # update - POST FORM AFTER EDIT
post '/owners/:id' do
  owner = Owner.new(params)
  owner.update
  @title = "Update Owner Details"
  redirect to "/owners/#{params['id']}"
  # redirect to confrmation page
end
#
# # destroy - POST ID DELETE
post '/owners/:id/delete' do
  owner = Owner.find(params['id'])
  owner.delete
  @title = "Delete Owner Details"
  redirect to '/owners/schedule'
end

# EXTRAS

get '/owners/pets/:id' do # index
  @pets = Pet.ownerspets(params['id'])
  @owners = Owner.all()
  @vets = Vet.all()
  @title = "Owners' Pets Details"
  erb (:"owners/owner_list")
end
