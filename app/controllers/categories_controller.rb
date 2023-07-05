class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:transactions)
    @categories = Category.all
    redirect_to new_user_registration_path unless user_signed_in?
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
