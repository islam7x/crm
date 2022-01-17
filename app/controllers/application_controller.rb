# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def set_columns
    @columns = ::Categories::Columns::ListService.call(category: @category).result
  end
end
