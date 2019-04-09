class PlayersController < ApplicationController
   get '/players/new' do
      erb :'/players/new'
   end

   post '/players' do
      player = Player.new(params[:player])
      binding.pry
      if player.valid?
         player.save
         session[:user_id] = player.id
         redirect '/decks/index'
      else
         redirect back
      end
   end

   get '/players/:slug/decks' do
      erb :'/players/decks'
   end
   
end