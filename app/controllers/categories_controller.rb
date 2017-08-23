class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
  end
  def new
    @categories = Category.all
  end
  def create
    @category = Category.new(category_params)
    if (@category.save)
      redirect_to new_category_path
    else
      Rails.logger.debug(@category.errors.inspect)
    end
  end
  private
  def category_params
    params.require(:category).permit(:name, :post_ids)
  end
end
