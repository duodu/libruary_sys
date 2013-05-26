class CommentsController < ApplicationController
  #添加书评
  def add_submit
    @comment = Comment.new(params[:comment])
    @comment.book_id = params[:id]
    if session[:user_id]
      @comment.user_id = session[:user_id]
    else
      @comment.user_id = 0
    end
    date = Time.new.strftime("%Y%m%d%H%M%S")
    @comment.uptime = date
    if @comment.save
      redirect_to :controller => "books", :action => "show", :id => params[:id]
      flash[:notice] = ["add comment success"]
    else
      redirect_to :controller => "books", :action => "show", :id => params[:id]
      flash[:notice] = ["add comment failed"]
      @comment.errors.full_messages.each do |msg|
        flash[:notice].push msg
      end
    end
  end
end
