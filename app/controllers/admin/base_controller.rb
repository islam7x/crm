# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    before_action :only_admin_user!

    private

    def only_admin_user!
      redirect_to(new_user_session_path) unless current_user.admin?
    end
  end
end
