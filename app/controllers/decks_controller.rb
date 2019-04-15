class DecksController < ApplicationController
   get '/decks/index' do
      @player = Player.find(session[:user_id]) if !!session[:user_id]
      @decks = Deck.all
      erb :'/decks/index'
   end

   post '/decks/new' do
      redirect '/decks/new'
   end

   get '/decks/new' do
      logged_in?
      @player = Player.find(session[:user_id])
      erb :'/decks/new'
   end

   post '/decks' do
      if !(params[:deck][:profession_id]) || params[:deck].values.include?("")
         flash[:message] = "Missing Deck's Information"
         redirect back
      else
         params[:deck][:profession_id] = params[:deck][:profession_id].to_i
         params[:deck][:creator_id] = params[:deck][:creator_id].to_i
         @deck = Deck.new(params[:deck])
      end
      @deck.code = params[:code] unless params[:code].empty?
      @deck.save
      @player = Player.find(session[:user_id])
      @player.decks << @deck
      redirect '/decks/index'
   end

   get '/decks/:id' do
      @deck = Deck.find(params[:id])
      erb :'/decks/show'
   end

   post '/decks/:id/edit' do
      redirect "/decks/#{params[:id]}/edit"
   end
   
   get '/decks/:id/edit' do
      logged_in?
      @deck = Deck.find(params[:id])
      erb :'/decks/edit'
   end

   post '/decks/:id/add' do
      logged_in?
      redirect "/decks/#{params[:id]}/add"
   end

   get '/decks/:id/add' do
      logged_in?
      @deck = Deck.find(params[:id])
      @player = Player.find(session[:user_id])
      @player.decks << @deck unless @deck.players.include?(@player)
      redirect "/decks/#{params[:id]}"
   end

   patch '/decks/:id' do
      @deck = Deck.find(params[:id])
      if !(params[:deck][:profession_id]) || params[:deck].values.include?("")
         flash[:message] = "Missing Deck's Information"
         redirect back
      else
         params[:deck][:profession_id] = params[:deck][:profession_id].to_i
         @deck.update(params[:deck])
         @deck.code = params[:code] unless params[:code].empty?
         @deck.save
         redirect "/players/#{@deck.creator.slug}/decks"
      end
   end

   delete '/decks/:id/delete' do
      logged_in?
      @deck = Deck.find(params[:id])
      Deck.destroy(params[:id]) if @deck.creator.id == session[:user_id]
      redirect '/decks/index'
   end
end