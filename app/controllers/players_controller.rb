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
         @other_decks = @player.decks
      else
         @other_decks = @player.decks.delete_if {|deck| deck.creator_id == @player.id}
      end
      erb :'/players/decks'
   end
   
end