class ReportController < ApplicationController

  post "/report_bridge" do #invisible route
    post_report("bridge")
  end

  post "/report_train" do #invisible route
    post_report("train")
  end

  delete "/report/:id" do
    delete_report
  end

  delete "/report/:id" do
    delete_report
  end

end
