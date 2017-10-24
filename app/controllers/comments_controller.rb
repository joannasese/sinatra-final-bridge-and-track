class CommentController < ApplicationController

  get "/reports/:id/comments/new" do #visible route
    if logged_in?
      @report = Report.find_by_id(params[:id])
      erb :"/comments/new"
    else
      redirect to '/login'
    end
  end

  post "/reports/:id/comments" do #invisible route
    if params[:content] != ""
      @comment = current_user.comments.build(content: params[:content])
      @comment.user_id = current_user.id
      @comment.report_id = current_user.reports.last.id
      @comment.save
      redirect to "/home" #redirects to homepage after comment page
    end
  end

end
