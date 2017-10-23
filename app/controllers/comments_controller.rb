class CommentController < ApplicationController

  get "/bridge_comment/:id" do #visible route
    @report = Report.find_by_id(params[:id])
    erb :"/reports/report_bridge"
  end

  post "/bridge_comment/:id" do #invisible route
    post_comment
  end

  get '/train_comment/:id' do #visible route
    @report = Report.find_by_id(params[:id])
    erb :"/reports/report_train"
  end

  post '/train_comment/:id' do #invisible route
    post_comment
  end

end
