class CommentController < ApplicationController

  get "/bridge_comment/:id" do #visible route
    @report = Report.find_by_id(params[:id])
    # @bridge_report_time = current_user.bridge_reports.last.time
    erb :"/reports/report_bridge"
  end

  post "/home/bridge_comment/:id" do #invisible route
    post_comment
  end

  get '/train_comment/:id' do #visible route
    @report = Report.find_by_id(params[:id])
    # @report_time = current_user.reports.last.time
    erb :"/reports/report_train"
  end

  post '/home/train_comment/:id' do #invisible route
    post_comment
  end

end
