# frozen_string_literal: true

module Categories
  class ItemsController < ApplicationController
    before_action :set_item, only: %i[edit destroy update]
    before_action :set_category, only: %i[update index edit destroy create new]
    before_action :set_columns, only: %i[new edit create update]

    def index
      @columns = ::Categories::Columns::ListService.call(
        to: params[:to],
        from: params[:from],
        category: @category
      ).result
      @items = ::Categories::Items::ListService.call(
        to: params[:to],
        from: params[:from],
        category: @category
      ).result
    end

    def new
      @item = Item.new
    end

    def create
      @item = Item.find_or_initialize_by(date_of_create: item_params[:date_of_create],
                                         column_id: item_params[:column_id])
      if @item.new_record?
        @item.assign_attributes(item_params.merge(category_id: @category.id))
        if @item.valid?
          @item.save
          redirect_to category_items_path(@category)
        else
          flash.now[:danger] = 'Заполните поля'
          render 'new'
        end
      else
        flash.now[:danger] = I18n.t("controllers.categories.items.danger_messages", href:  edit_category_item_path(@category, @item)).html_safe
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

    def item_params
      params.require(:item).permit(:quantity, :weight, :column_id, :date_of_create)
    end

    def set_item
      @item = Item.find(params[:id])
    end

    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_columns
      @columns = @category.columns.order_by_position
    end
  end
end
