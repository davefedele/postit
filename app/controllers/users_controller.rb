class UsersController < ApplicationController
before_action :set_user, only: [:show, :update, :edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You are registered."
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = "Updated your profile"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def show
    @post = @user.posts
  end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end
end