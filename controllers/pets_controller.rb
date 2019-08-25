require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/pets.rb' )
require_relative( '../models/vets.rb' )
also_reload( '../models/*' )

#404 Error! - Not Found
error Sinatra::NotFound do
  @title = "Nothing to see here... move along please"
  #   erb :oops, :layout => :page404
  # How does it work across routes>??????
  erb(:oops)
end

get '/pets' do # index
  @pets = Pet.all()
  erb( :list )
end

# <div id='footer'> INCLUDE OTHER FILES IN ERB
#       <%= erb :footer %>
#     </div>

# # get '/vet' do # index
# #   # @pets = Pet.all()
# #   @title = "Vet's Schedule"
# #   erb( :vet )
# # end
#
# get '/vet/list' do # index
#   @pets = Pet.all()
#   @title = "Vet's Schedule"
#   # erb( :vet_list )
#   erb :'vets', :layout => :vets_layout
# end
#
# get '/vet/:id' do # index
#   @pets = Pet.vetspets(params['id'])
#   erb :'vet_list', :layout => :vets_layout
#   # erb :'vet_list', :layout => :vets_layout
# end

# PETS ADD, UPDATE, LIST, DELETE
# show - GET FIND BY ID


# new - GET NEW PET ORDER FORM
get '/pets/new' do # new
  @pet = Pet.all()
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
get '/pets/:id' do
  @pet = Pet.find(params['id'])
  erb(:show)
end

get '/pets/:id/edit' do
  @vets = Vet.all
  @pettype = PetType.all
  @pet = Pet.find(params['id'])
  erb(:edit)
end

# update - POST FORM AFTER EDIT
post '/pets/:id' do
  pet = Pet.new(params)
  pet.update
  redirect to "/pets/#{params['id']}"
  # redirect to confrmation page
end

# destroy - POST ID DELETE
post '/pets/:id/delete' do
  pet = Pet.find(params['id'])
  pet.delete
  redirect to '/pets'
end
