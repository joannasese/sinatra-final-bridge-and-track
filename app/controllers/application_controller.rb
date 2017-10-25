require './config/environment'

class ApplicationController < Sinatra::Base
   use Rack::Flash

  configure do
      set :public_folder, 'public'
      set :views, 'app/views'
      enable :sessions
      set :session_secret, "b_and_t_security"
    end

    get '/' do
      erb :"index"
    end

# HELPER METHODS
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

end
