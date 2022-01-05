# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_item, only: %i[edit destroy update]
  before_action :set_category, only: %i[update edit destroy create new]
  before_action :set_column, only: %i[new edit]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = @category.items.new(item_params)
    if @item.save
      redirect_to category_items_path(@category)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @item.update(item_params)
      redirect_to category_items_path(@category)
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to category_items_path(@category)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_column
    @columns = @category.columns
  end

  def item_params
    params.require(:item).permit(:quantity, :weight, :column_id)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end
end
