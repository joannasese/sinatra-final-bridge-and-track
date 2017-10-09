class CommentController < ApplicationController

  post '/home' do
      @comment = current_user.comments.create(content: params[:content])
      @comment.user_id = current_user.id
      redirect to "/home"
  end

end
