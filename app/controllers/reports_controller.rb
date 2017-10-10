class ReportController < ApplicationController

  post "/report_bridge" do
    if logged_in?
      @bridge_report = current_user.bridge_reports.create(time: params[:time])
      @bridge_report.user_id = current_user.id
      @bridge_report.save
      redirect to "/bridge_comment/#{@bridge_report.id}"
    else
      redirect to '/login'
    end
  end

  post "/report_train" do
    if logged_in?
      @train_report = current_user.train_reports.create(time: params[:time])
      @train_report.user_id = current_user.id
      @train_report.save
      redirect to "/train_comment/#{@train_report.id}"
    else
      redirect to '/login'
    end
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
      # binding.pry
      @comment = @train_report.comments.find_by(:train_report_id => params[:id])
      @train_report.delete
      if @comment
        @comment.delete
      end
      redirect to "/home"
    else
      redirect to "/login"
    end
  end

end
