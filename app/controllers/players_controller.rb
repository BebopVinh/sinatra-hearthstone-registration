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
         erb :'/players/decks'
      end
   end

   post '/players/:slug/edit' do
      logged_in?
      @player = Player.find_by_slug(params[:slug])
      redirect "/players/#{params[:slug]}/edit"
   end

   get '/players/:slug/edit' do
      logged_in?
      @player = Player.find_by_slug(params[:slug])
      if @player.id == session[:user_id]
         erb :'/players/edit'
      else
         redirect '/'
      end
   end


   patch '/players/:slug' do
      @player = Player.find_by_slug(params[:slug])
      redirect '/logout' if @player.id != session[:user_id]
      if @player and @player.authenticate(params[:old_password])
         @player.update(params[:player])
         redirect "/players/#{@player.slug}/decks"
      else
         redirect back
      end
   end

   delete '/players/:slug/delete' do
      logged_in?
      @player = Player.find_by_slug(params[:slug])
      @created_deck_ids = Deck.all.map {|deck| deck.id if deck.creator_id == @player.id}
      Deck.destroy(@created_deck_ids.compact)
      Player.destroy(@player.id)
      redirect '/logout'
   end
end