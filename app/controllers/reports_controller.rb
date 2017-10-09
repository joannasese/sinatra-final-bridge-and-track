class ReportController < ApplicationController

  # get "/report_bridge" do
  #   @bridge_reports = BridgeReport.all
  #   erb :"/users/home"
  # end

  post "/report_bridge" do
    if params[:time] != nil
      @bridge_report = current_user.bridge_reports.create(time: params[:time])
      @bridge_report.user_id = current_user.id
      erb :"/reports/report_bridge"
    else
      redirect to '/login'
    end
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

  get "/home" do #do i need this?
    erb :"/users/home"
  end

end
