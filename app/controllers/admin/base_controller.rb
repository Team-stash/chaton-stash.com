module Admin
  class BaseController < ApplicationController
    before_action :require_admin

    private

    def require_admin
      unless current_user&.admin?
        redirect_to root_path, alert: "Vous n'avez pas accès à cette page."
      end
    end
  end
end
