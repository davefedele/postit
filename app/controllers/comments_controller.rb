class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:body))

    if @comment.save
      flash[:notice] = "The comment was created."
      redirect_to post_path(@post)
    else
      @post.comments.reload
      render 'posts/show'
    end
  end

end