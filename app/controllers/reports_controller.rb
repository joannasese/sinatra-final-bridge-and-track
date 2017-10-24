class ReportController < ApplicationController

  post "/reports" do #invisible route
    if logged_in?
      @report = current_user.reports.create(time: params[:time], mode: params[:mode])
      @report.user_id = current_user.id
      if @report.save
        redirect to "/reports/#{@report.id}"
      else
        redirect to '/home'
      end
    else
      redirect to '/login'
    end
  end

  get "/reports/:id" do #visible route
    @report = Report.find_by_id(params[:id])
    erb :"/reports/show"
  end

  delete "/reports/:id" do #invisible route
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

end
