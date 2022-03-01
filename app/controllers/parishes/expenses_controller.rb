# frozen_string_literal: true

module Parishes
  class ExpensesController < ApplicationController

    before_action :set_expense, only: %i[update edit destroy]
    before_action :set_parish, only: %i[index new create edit update destroy]

    def index
      @expenses = @parish.expenses
    end

    def new
      @expense = Expense.new
    end

    def create
      @expense = @parish.expenses.new(expense_params)
      if @expense.save
        @parish.update(remainder: update_remainder)
        redirect_to parish_expenses_path(@parish)
      else
        render 'new'
      end
    end

    def edit; end

    def update
      if @expense.update(expense_params)
        @parish.update(remainder: update_remainder)
        redirect_to parish_expenses_path(@parish)
      else
        render 'edit'
      end
    end

    def destroy
      if @expense.destroy
        @parish.update(remainder: update_remainder)
        redirect_to parish_expenses_path(@parish)
      end
    end

    private

    def set_parish
      @parish = Parish.find(params[:parish_id])
    end

    def update_remainder
      @parish.quantity - (@expense.killed + @expense.sold_count)
    end

    def set_expense
      @expense = Expense.find(params[:id])
    end

    def expense_params
      params.require(:expense).permit(:killed, :killed_weight, :sold_count, :sold_weight, :date_of_create, :parish_id)
    end
  end
end
