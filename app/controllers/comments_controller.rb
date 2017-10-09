class CommentController < ApplicationController

  get "/bridge_comment/:id" do
    @bridge_report = BridgeReport.find_by_id(params[:id])
    @bridge_report_time = current_user.bridge_reports.last.time
    erb :"/reports/report_bridge"
  end

  post "/home/bridge_comment/:id" do
    if params[:content] != ""
      @comment = current_user.comments.create(content: params[:content])
      @comment.user_id = current_user.id
      @comment.bridge_report_id = current_user.bridge_reports.last.id
      @comment.save
      redirect to "/home"
    end
  end

  get '/train_comment' do
    @train_report_time = current_user.train_reports.last.time
    erb :"/reports/report_train"
  end

  post '/home/train_comment' do
    if params[:content] != ""
      @comment = current_user.comments.create(content: params[:content])
      @comment.user_id = current_user.id
      @comment.train_report_id = current_user.train_reports.last.id
      @comment.save
      redirect to "/home"
    end
  end

end
