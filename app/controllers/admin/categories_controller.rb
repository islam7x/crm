# frozen_string_literal: true

module Admin
  class CategoriesController < BaseController
    before_action :set_category, only: %i[show edit destroy update]
    before_action :set_columns, only: %i[show]
    #before_action :admin_user

    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def edit; end

    def update
      if @category.update(category_params)
        redirect_to admin_category_path(@category)
      else
        render 'edit'
      end
    end

    def show
      redirect_to admin_categories_path unless @category
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to admin_category_path(@category)
      else
        render 'new'
      end
    end

    def destroy
      @category.destroy
      redirect_to admin_categories_path
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
end
