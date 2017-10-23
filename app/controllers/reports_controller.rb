class ReportController < ApplicationController

  post "/report_bridge" do #invisible route
    post_report("bridge")
  end

  post "/report_train" do #invisible route
    post_report("train")
  end

  delete "/delete_bridge_report/:id" do
    delete_report
  end

  delete "/delete_train_report/:id" do
    delete_report
  end

end
