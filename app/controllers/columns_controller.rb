# frozen_string_literal: true

class ColumnsController < ApplicationController
  before_action :set_column, only: %i[update edit destroy]
  before_action :set_category, only: %i[update edit destroy create new]

  def new
    @column = Column.new
  end

  def edit; end

  def update
    if @column.update(column_params)
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def create
    @column = @category.columns.new(column_params)
    if @column.save
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  def destroy
    @column.update(deleted_at: Time.current)
    redirect_to category_path(@category)
  end

  private

  def column_params
    params.require(:column).permit(:name)
  end

  def set_column
    @column = Column.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

end
