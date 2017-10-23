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

    helpers do
      def current_user
        current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
      end

      def logged_in?
        !!current_user
      end

      def post_report(mode)
        if logged_in?
          @report = current_user.reports.create(time: params[:time])
          @report.user_id = current_user.id
          @report.type = mode
          if @report.save
            redirect to "/#{mode}_comment/#{@report.id}" #visible route
          else
            redirect to '/'
          end
        else
          redirect to '/login'
        end
      end

    end

end
