class UserController < ApplicationController

  get '/login' do
    if !logged_in?
      erb :"/users/login"
    else
      redirect to "/home"
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/home"
    else
      redirect to "/signup"
    end
    erb :"index"
  end

  get '/signup' do
    if !logged_in?
      erb :"/users/signup"
    else
      redirect to "/home"
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to "/signup"
    else
      @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to "/home"
    end
  end

  get '/home' do
    erb :'users/home'
  end

  get '/logout' do
    session.destroy
    redirect to "/login"
  end

end
