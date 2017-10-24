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
    if !@user
      flash[:error] = "Wrong username and/or password."
      redirect to "/login"
    else
      @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/home"
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
      flash[:error] = "Username, email and password required for signup."
      redirect to "/signup"
    else
      @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to "/home"
    end
  end

  get '/home' do
    if logged_in?
      @reports = Report.all
      @bridge_reports = @reports.select {|report| report.mode=="bridge"}
      @train_reports = @reports.select {|report| report.mode=="train"}
      erb :'users/show'
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    session.destroy
    redirect to "/login"
  end

end
