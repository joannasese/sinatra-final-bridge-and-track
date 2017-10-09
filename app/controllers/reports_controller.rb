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

  get '/bridge_comment' do
    @bridge_report_time = current_user.bridge_reports.last.time
    erb :"/reports/report_bridge"
  end

  post "/report_train" do
    if logged_in?
      @train_report = current_user.train_reports.create(time: params[:time])
      @train_report.user_id = current_user.id
      erb :"/reports/report_train"
    else
      redirect to '/login'
    end
  end

end
