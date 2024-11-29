class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def authorize_admin
    redirect_to root_path, alert: 'Accès non autorisé' unless current_user&.admin?
  end
end
