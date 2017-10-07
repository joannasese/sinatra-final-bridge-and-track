class UserController < ApplicationController

  get '/login' do
    if !logged_in
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
  end


end
