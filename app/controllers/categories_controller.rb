class CategoriesController < ApplicationController

  before_action :find_item, only:[:show, :edit, :destroy, :update]

  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def update
    @category.update(category_params)
    if @category.errors.empty?
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def show
    unless @category
      redirect_to categories_path
    end
  end

  def create
    @category = Category.create(category_params)
    if @category.errors.empty?
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  def destroy
    @category.destroy
    redirect_to action: 'index'
  end

  private

  def find_item
    @category = Category.where(id: params[:id]).find
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
