require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
  end

  get "/" do
    erb :home
  end

  get '/login' do 
    erb :login
  end

  post '/login' do
    binding.pry
  end

  get '/logout'  do
    session.clear
    redirect '/login'
  end

  helpers do
    def logged_in?
      if !!sesion[:user_id]
        return
      else
        redirect '/login'
      end
    end

    def current_user
      user = User.find(session[:user_id])
    end
  end

  
end
