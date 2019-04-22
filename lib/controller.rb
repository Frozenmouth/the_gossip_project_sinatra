require 'bundler'
require 'gossip'
require 'csv'
Bundler.require

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    #Initialize the Gossip class. The poster name & content are used as the arguments.
    #The saved informations will be stocked directly into the gossip.csv file in the databse.
    Gossip.new(params[:gossip_author], params[:gossip_content]).save
    #Redirect User to main page
    redirect '/'
  end

  get '/gossips/:id' do
    id_value = params[:id]
    puts id_value
    id_value_int = id_value.to_i-1
    puts id_value_int
    tab_gossip = []
    tab_gossip = Gossip.all
    "Potin N° #{id_value}, posté par #{tab_gossip[id_value_int].author} : #{tab_gossip[id_value_int].content}"
  end
end
