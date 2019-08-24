require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/pet')
require_relative('./models/vet')
require_relative('./models/pettype')
also_reload('./models/*')

#404 Error! - Not Found
error Sinatra::NotFound do
  @title = "Nothing to see here... move along please"
  #   erb :oops, :layout => :page404
  # How does it work across routes>??????
  erb(:oops)
end

# index - GET LISTS ALL
get '/' do
  @title = "Acorn Vet Practice"
  erb( :index )
end

# get '/pets' do # index
#   @pets = Pet.all()
#   erb( :list )
# end

get '/vets/:id' do # index
  @pets = Pet.vetspets(params['id'])
  erb( :list )
end

# PETS ADD, UPDATE, LIST, DELETE
# show - GET FIND BY ID


# new - GET NEW PET ORDER FORM
# get '/pets/new' do # new
#   @title = "Register a New Pet"
#   erb( :new )
# end

# create - POST FORM TO CREATE
# post '/pets' do # create
#   @pet = Pet.new( params )
#   @pet.save()
#   @title = "#{@pet.name} Pet Registered"
#   erb( :create )
# end

# edit - GET FORM BY ID TO EDIT
# get '/pets/:id' do
#   @pet = Pet.find(params['id'])
#   erb(:show)
# end

# get '/pets/:id/edit' do
#   @vets = Vet.all
#   @pettype = PetType.all
#   @pet = Pet.find(params['id'])
#   erb(:edit)
# end

# update - POST FORM AFTER EDIT
# post '/pets/:id' do
#   pet = Pet.new(params)
#   pet.update
#   redirect to "/pets/#{params['id']}"
  # redirect to confrmation page
# end

# destroy - POST ID DELETE
# post '/pets/:id/delete' do
#   pet = Pet.find(params['id'])
#   pet.delete
#   redirect to '/pets'
# end
