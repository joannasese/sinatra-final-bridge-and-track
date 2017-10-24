class ReportController < ApplicationController

  # post "/report_bridge" do #invisible route
  #   post_report("bridge")
  # end
  #
  # post "/report_train" do #invisible route
  #   post_report("train")
  # end

  delete "/report/:id" do
    delete_report
  end

  post "/reports" do
    if logged_in?
      @report = current_user.reports.build(time: params[:time], mode: params[:mode])
        binding.pry
      if current_user.save
        redirect to "/#{@report.mode}_comment/#{@report.id}"

      else
        redirect to '/'
      end
    else
        redirect to '/login'
    end
  end

end
