# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit destroy update]
  before_action :set_columns, only: %i[show]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def show
    redirect_to categories_path unless @category
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def set_columns
    @columns = @category.columns
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
