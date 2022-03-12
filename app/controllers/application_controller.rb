# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def set_parish_with_sum
    @parish_with_sum =
      Parish
        .left_joins(:expenses)
        .select('parishes.*, SUM(expenses.killed) AS sum_killed, SUM(expenses.sold_count) AS sum_sold_count')
        .group(:id)
        .find(params[:parish_id])
  end
end
