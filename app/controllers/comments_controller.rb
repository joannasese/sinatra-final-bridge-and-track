class CommentController < ApplicationController

  get "/bridge_comment/:id" do #visible route
    @bridge_report = BridgeReport.find_by_id(params[:id])
    @bridge_report_time = current_user.bridge_reports.last.time
    erb :"/reports/report_bridge"
  end

  post "/home/bridge_comment/:id" do #invisible route
    if params[:content] != "" #make as helper method? since code is repeated starting line 26
      @comment = current_user.comments.create(content: params[:content])
      @comment.user_id = current_user.id
      @comment.bridge_report_id = current_user.bridge_reports.last.id
      @comment.save
      redirect to "/home" #redirects to homepage after comment page
    end
  end

  get '/train_comment/:id' do #visible route
    @report = Report.find_by_id(params[:id])
    # @report_time = current_user.reports.last.time
    erb :"/reports/report_train"
  end

  post '/home/train_comment/:id' do #invisible route
    if params[:content] != ""
      @comment = current_user.comments.create(content: params[:content])
      @comment.user_id = current_user.id
      @comment.report_id = current_user.reports.last.id
      @comment.save
      redirect to "/home" #redirects to homepage after comment page
    end
  end

end
