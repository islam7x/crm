# frozen_string_literal: true

class ParishesController < ApplicationController
  before_action :set_parish, only: %i[edit update destroy]

  def index
    @parishes = Parish.all.order(date_of_create: :desc)
  end

  def new
    @parish = Parish.new
  end

  def create
    @parish = Parish.new(parish_params.merge(remainder: parish_params[:quantity]))
    if @parish.save
      redirect_to parishes_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @parish.update(parish_params)
      update_remainder
      redirect_to parishes_path
    else
      render 'edit'
    end
  end

  def destroy
    @parish.destroy
    redirect_to parishes_path
  end

  private

  def update_remainder
    parish =
      Parish
        .joins(:expenses)
        .select('parishes.*, SUM(expenses.killed) AS sum_killed, SUM(expenses.sold_count) AS sum_sold_count')
        .group(:id)
        .find(params[:parish_id])
    @parish.update(remainder: @parish.quantity - (parish.sum_killed + parish.sum_sold_count))
  end

  def parish_params
    params.require(:parish).permit(:name, :quantity, :date_of_create)
  end

  def set_parish
    @parish = Parish.find(params[:id])
  end
end
