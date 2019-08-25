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

# get '/vet' do # index
#   # @pets = Pet.all()
#   @title = "Vet's Schedule"
#   erb( :vet )
# end

get '/vet/list' do # index
  @pets = Pet.all()
  @title = "Vet's Schedule"
  # erb( :vet_list )
  erb :'vets', :layout => :vets_layout
end

get '/vet/:id' do # index
  @pets = Pet.vetspets(params['id'])
  erb :'vet_list', :layout => :vets_layout
  # erb :'vet_list', :layout => :vets_layout
end
