class ReportController < ApplicationController
  post "/report_train" do
    if logged_in?
      erb :"/report/report_train"
    else
      redirect to '/login'
    end

  end

end
