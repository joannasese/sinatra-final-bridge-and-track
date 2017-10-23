class ReportController < ApplicationController

  post "/report_bridge" do #invisible route
    # if logged_in?
    #   @bridge_report = current_user.bridge_reports.build(time: params[:time])
    #   if @bridge_report.save
    #     redirect to "/bridge_comment/#{@bridge_report.id}"
    #   else
    #     redirect to '/'
    #   end
    # else
    #   redirect to '/login'
    # end
    post_report("bridge")
  end

  post "/report_train" do #invisible route
    post_report("train")
  end

  delete "/delete_bridge_report/:id" do
    if logged_in?

      @bridge_report = BridgeReport.find_by_id(params[:id])
      @comment = @bridge_report.comments.find_by(:bridge_report_id => params[:id])
      @bridge_report.delete
      if @comment
        @comment.delete
      end
      redirect to "/home"
    else
      redirect to "/login"
    end
  end

  delete "/delete_train_report/:id" do
    if logged_in?
      @train_report = TrainReport.find_by_id(params[:id])
      @train_report
      redirect to "/home"
    else
      redirect to "/login"
    end
  end

end
