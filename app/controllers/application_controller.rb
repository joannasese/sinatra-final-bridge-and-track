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
    current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  # def post_report(mode)
  #   if logged_in?
  #     @report = current_user.reports.create(time: params[:time]) #will not work with build/new
  #     @report.user_id = current_user.id
  #     @report.mode = mode
  #     if @report.save
  #       redirect to "/#{mode}_comment/#{@report.id}" #visible route
  #     else
  #       redirect to '/'
  #     end
  #   else
  #     redirect to '/login'
  #   end
  # end

  # def post_comment
  #   if params[:content] != ""
  #     @comment = current_user.comments.create(content: params[:content])
  #     @comment.user_id = current_user.id
  #     @comment.report_id = current_user.reports.last.id
  #     @comment.save
  #     redirect to "/home" #redirects to homepage after comment page
  #   end
  # end

  # def delete_report
    # deleting report does not appeat to automatically delete comment. comment currently deleted separately.
    # if logged_in?
    #   @report = Report.find_by_id(params[:id])
    #   @comment = @report.comments.find_by(:report_id => params[:id])
    #   @report.delete
    #   if @comment
    #     @comment.delete
    #   end
    #   redirect to "/home"
    # else
    #   redirect to "/login"
    # end
  # end

end
