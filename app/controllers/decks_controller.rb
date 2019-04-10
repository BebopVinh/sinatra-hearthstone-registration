class DecksController < ApplicationController
   get '/decks/index' do
      logged_in?
      erb :'/decks/index'
   end

   get '/decks/:id' do
      @deck = Deck.find(params[:id])
      erb :'/decks/show'
   end
   
   get '/decks/:id/edit' do
      logged_in?
      @deck = Deck.find(params[:id])
      erb :'/decks/edit'
   end

   patch '/decks/:id' do
      @deck = Deck.find(params[:id])
      binding.pry
      if params[:deck].values.include?("")
         redirect back
      else
         @deck.update(params[:deck])
         @deck.code = params[:code] unless params[:code].empty?
         @deck.save
         redirect "/players/#{@deck.creator.slug}/decks"
      end
   end
end