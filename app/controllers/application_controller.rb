require './config/environment'

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, proc { File.join(root, '../views/') }
    enable :sessions
    set :session_secret, HASHKEY
    register Sinatra::Flash
  end

  get "/" do
    erb :home
  end

  get '/login' do
    session.clear if !!session[:user_id] 
    erb :login
  end

  post '/login' do
    player = Player.find_by(username: params[:username])
    if player && player.authenticate(params[:password])
      session[:user_id] = player.id
      binding.pry
      redirect '/decks/index'
    else
      flash[:message] = "Invalid username/password."
      redirect '/login'
    end
  end

  post '/logout' do
    redirect '/logout'
  end
  
  get '/logout' do
    session.clear
    flash[:message] = "Logged out sucessfully."
    redirect '/'
  end

  helpers do
    def logged_in?
      if !!session[:user_id]
        return
      else
        flash[:message] = "Please login or register"
        redirect back
      end
    end

    def current_user
      user = User.find(session[:user_id])
    end
  end

  
end
