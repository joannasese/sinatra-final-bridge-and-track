class ReportController < ApplicationController
  post "/report_train" do
    if logged_in?
      @train_report = current_user.train_reports.create(:time => params[:time])
      @train_report.user_id = current_user.id
      erb :"/reports/report_train"
    else
      redirect to '/login'
    end
  end

  post "/report_bridge" do
    if logged_in?
      erb :"/reports/report_bridge"
    else
      redirect to '/login'
    end
  end


end
