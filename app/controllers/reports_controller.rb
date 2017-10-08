class ReportController < ApplicationController
  post "/report_train" do
    @time = Time.now
    if logged_in?
      erb :"/reports/report_train"
    else
      redirect to '/login'
    end
  end

  post "/report_bridge" do
    @time = Time.now
    if logged_in?
      erb :"/reports/report_bridge"
    else
      redirect to '/login'
    end
  end


end
