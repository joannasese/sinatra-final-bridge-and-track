class ReportController < ApplicationController

  post "/report_bridge" do
    if logged_in?
      @bridge_report = current_user.bridge_reports.create(time: params[:time])
      @bridge_report.user_id = current_user.id
      @bridge_report.save
      redirect to '/bridge_comment'
    else
      redirect to '/login'
    end
  end

  post "/report_train" do
    if logged_in?
      @train_report = current_user.train_reports.create(time: params[:time])
      @train_report.user_id = current_user.id
      @train_report.save
      redirect to '/train_comment'
    else
      redirect to '/login'
    end
  end

end
