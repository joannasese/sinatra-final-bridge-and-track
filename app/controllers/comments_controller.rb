class CommentController < ApplicationController

  post '/home' do
    if params[:content] != ""
      @comment = current_user.comments.create(content: params[:content])
      @comment.user_id = current_user.id
      @comment.bridge_report_id = current_user.bridge_reports.last.id
      @comment.save
      redirect to "/home"
    end
  end

end
