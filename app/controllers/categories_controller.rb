class CategoriesController < ApplicationController
  
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

  private

  def post_params
    params.require(:category).permit(:name, :creator)
  end
end