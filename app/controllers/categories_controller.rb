class CategoriesController < ApplicationController
  def index
    @category = Category.all
    @new_category = Category.new
  end

  def show
    @category = Category.find(params[:id].to_i)
    @products_in_category = @category.products #Product_categories.find_by category_id: (params[:id].to_i)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
