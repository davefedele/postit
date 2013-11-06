class CategoriesController < ApplicationController
before_action :set_post, only: [:show,:edit,:update]

  def index
    @category = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(post_params)

    if @category.save
      flash[:notice] = "The category was created."
      redirect_to posts_path
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @category.update(post_params)
      flash[:notice] = "The category was updated."
      redirect_to category_path(@category)
    else
      render :edit
    end
  end
  
  private

  def post_params
    params.require(:category).permit!
  end

  def set_post
    @category = Category.find(params[:id ])    
  end

end