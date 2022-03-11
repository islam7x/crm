# frozen_string_literal: true

module Parishes
  class ExpensesController < ApplicationController
    before_action :set_expense, only: %i[update edit destroy]
    before_action :set_parish

    def index
      @parishes = Parish.all
      @expenses = @parish.expenses
    end

    def new
      @expense = Expense.new
    end

    def create
      @expense = Expense.new(expense_params)
      if @expense.save
        update_remainder
        redirect_to parish_expenses_path(@parish)
      else
        render 'new'
      end
    end

    def edit; end

    def update
      if @expense.update(expense_params)
        update_remainder
        redirect_to parish_expenses_path(@parish)
      else
        render 'edit'
      end
    end

    def destroy
      update_remainder if @expense.destroy
      redirect_to parish_expenses_path(@parish)
    end

    private

    def set_parish
      @parish = Parish.find(params[:parish_id])
    end

    def update_remainder
      parish =
        Parish
          .joins(:expenses)
          .select('parishes.*, SUM(expenses.killed) AS sum_killed, SUM(expenses.sold_count) AS sum_sold_count')
          .group(:id)
          .find(params[:parish_id])
      @parish.update(remainder: @parish.quantity - (parish.sum_killed + parish.sum_sold_count))
    end

    def set_expense
      @expense = Expense.find(params[:id])
    end

    def expense_params
      params.require(:expense).permit(:killed, :killed_weight, :sold_count, :sold_weight, :date_of_create, :parish_id)
    end
  end
end
