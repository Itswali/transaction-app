class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to root_path, notice: 'Category created successfully.'
    else
      render :new
    end
  end

  # Rest of the controller actions...

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end