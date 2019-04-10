require './config/environment'

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, proc { File.join(root, '../views/') }
    enable :sessions
    set :session_secret, HASHKEY
  end

  get "/" do
    if !!session[:user_id]
      redirect '/decks/index'
    else
      erb :home
    end
  end

  get '/login' do 
    if !!session[:user_id]
      redirect '/logout'
    else
      erb :login
    end
  end

  post '/login' do
    player = Player.find_by(username: params[:username])
    if player && player.authenticate(params[:password])
      session[:user_id] = player.id
      redirect '/decks/index'
    else
      redirect '/login'
    end
  end

  post '/logout' do
    redirect '/logout'
  end
  
  get '/logout'  do
    session.clear
    redirect '/'
  end

  helpers do
    def logged_in?
      if !!session[:user_id]
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
