class CommentsController < ApplicationController
  before_action :require_user
  
  def create
    @post = Post.find_by(slug: params[:post_id]) #had to set up parent object in nested relationship
    
    # line 7 replaces lines 8 and 9
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    # @comment = Comment.new(params[:comment].permit(:body))
    # @comment.post = @post

    @comment.creator = current_user

    if @comment.save
      flash[:notice] = "Your comment was added."
      redirect_to post_path(@post)
    else
      render 'posts/show' #expects @post and @comment which are created at the top of this action
    end
  end

  def vote
    @comment = Comment.find(params[:id])
    @vote = Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])

    # if @vote.valid?
    #   flash[:notice] = "Your vote vas counted."
    # else
    #   flash[:error] = "You can only vote for this comment once."
    # end

    respond_to do |format|
      format.html {redirect_to :back, notice: "Your vote was counted"}
      format.js {}
    end
  end

end
