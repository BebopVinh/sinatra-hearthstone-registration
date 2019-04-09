class DecksController < ApplicationController
   get '/decks/index' do
      logged_in?
      erb :'/decks/index'
   end
   
end