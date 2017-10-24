class CommentController < ApplicationController

  get "/reports/:id/comments" do #visible route
    @report = Report.find_by_id(params[:id])
    erb :"/reports/show"
  end

  post "/reports/:id/comments" do #invisible route
    if params[:content] != ""
      @comment = current_user.comments.build(content: params[:content])
      @comment.user_id = current_user.id
      @comment.report_id = current_user.reports.last.id
      @comment.save
      redirect to "/home" #redirects to homepage after comment page
    end
  end

  # get '/comment/:id' do #visible route
  #   @report = Report.find_by_id(params[:id])
  #   erb :"/reports/report_train"
  # end
  #
  # post '/train_comment/:id' do #invisible route
  #   post_comment
  # end

end
