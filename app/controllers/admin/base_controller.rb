# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    #redirect_to(new_user_session_path) unless current_user.admin?
  end
end
