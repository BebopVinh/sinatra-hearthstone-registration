class PlayersController < ApplicationController
   get '/players/new' do
      erb :'/players/new'
   end

   post '/players' do
      player = Player.new(params[:player])
      if player.valid?
         player.save
         session[:user_id] = player.id
         redirect '/decks/index'
      else
         redirect back
      end
   end

   get '/players/:slug/decks' do
      @player = Player.find_by_slug(params[:slug])
      unless !!@player
         redirect '/error'
      end
      @created_decks = Deck.where(creator_id: @player.id)
      if @player.decks.empty?
         erb :'/players/empty'
      else
         @other_decks = @player.decks - @created_decks
      end
   end

   delete '/players/:slug/delete' do
      logged_in?
      @player = Player.find_by_slug(params[:slug])
      Player.destroy(@player.id)
      redirect '/'
   end
   
end