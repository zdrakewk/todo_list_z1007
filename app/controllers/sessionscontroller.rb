class SessionsController < ApplicationController

  get '/login' do
    erb :'sessions/login'
  end 

  post '/login' do
    # 1) find user
    user = User.find_by(username: params[:username]) 
    
    # login into app if password matches
    # & send to main page in app
    # else send back to form
    
    if user && user.authenticate(params[:password])
      # login user into app
      session[:user_id] = user.id
      redirect '/todos'
    else
      redirect '/login' # render an error too???
    end

  end 

  delete '/logout' do
    # binding.pry
    # remove key from hash
    session.delete(:user_id)
    redirect '/'
  end

end