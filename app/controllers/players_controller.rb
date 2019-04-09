class PlayersController < ApplicationController
   get '/players/new' do
      erb :'/players/new'
   end

   post '/players' do
      binding.pry
   end

   get '/players/decks' do
      erb :'/players/decks'
   end
   
end