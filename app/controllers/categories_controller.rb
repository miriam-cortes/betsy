class CategoriesController < ApplicationController
  def index
    @category = Category.all
  end

  def show
    @category = Category.find(params[:id].to_i)
    @products_in_category = @category.products #Product_categories.find_by category_id: (params[:id].to_i)
  end

  def new
    Category.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
