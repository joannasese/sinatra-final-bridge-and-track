class CommentController < ApplicationController

  post "/reports/:report_id/comments" do #invisible route
    if @report = Report.find_by(id: params[:report_id])
      @comment = @report.comments.build(content: params[:content], user: current_user)
      if @comment.save
        redirect to "/reports/#{@report.id}"
      else
        redirect to "/reports/#{@report.id}/comments/new"
      end
    else
      redirect to '/home'
    end
  end

  delete "/reports/:report_id/comments/:id" do
    if @report = Report.find_by(id: params[:report_id])
      @comment = @report.comments.find_by(id: params[:id])
      if @comment && @comment.user == current_user
        @comment.destroy
      end
      redirect to "/reports/#{@report.id}"
    else
      redirect to '/home'
    end
  end

end
