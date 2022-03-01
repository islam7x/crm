# frozen_string_literal: true

class ParishesController < ApplicationController

  before_action :set_parish, only: %i[edit update destroy]

  def index
    @parishes = Parish.all
  end

  def new
    @parish = Parish.new
  end

  def create
    @parish = Parish.new(parish_params)
    if @parish.save
      redirect_to parishes_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @parish.update(parish_params)
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

  def parish_params
    params.require(:parish).permit(:name, :quantity, :date_of_create)
  end

  def set_parish
    @parish = Parish.find(params[:id])
  end
end
