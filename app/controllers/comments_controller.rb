class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id]) #had to set up parent object in nested relationship
    
    # line 7 replaces lines 8 and 9
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    # @comment = Comment.new(params[:comment].permit(:body))
    # @comment.post = @post

    # set user - temporary until add oath
    @comment.creator = User.first

    if @comment.save
      flash[:notice] = "Your comment was added."
      redirect_to post_path(@post)
    else
      render 'posts/show' #expects @post and @comment which are created at the top of this action
    end
  end

end