class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @category.posts
  end
  def new
    @categories = Category.all
  end
  def create
    @category = Category.new(category_params)
    if (@category.save)
      redirect_to new_category_path
    else
      flash[:alert] = "Kategori oluşturulurken hata oluştu"
      redirect_to new_category_path
    end
  end
  private
  def category_params
    params.require(:category).permit(:name)
  end
end
