class ReportController < ApplicationController

  delete "/report/:id" do
    if logged_in?
      @report = Report.find_by_id(params[:id])
      @comment = @report.comments.find_by(:report_id => params[:id])
      @report.delete
      if @comment
        @comment.delete
      end
      redirect to "/home"
    else
      redirect to "/login"
    end
  end

  post "/reports" do
    if logged_in?
      @report = current_user.reports.create(time: params[:time], mode: params[:mode])
      if @report.save
        redirect to "/comment/#{@report.id}"
      else
        redirect to '/'
      end
    else
      redirect to '/login'
    end
  end

end
