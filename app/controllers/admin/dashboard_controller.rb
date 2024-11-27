class Admin::DashboardController < ApplicationController
  ApplicationController
  before_action :authenticate
  before_action :authorize_admin

  def index
    @users = User.all
  end

  private

  def authorize_admin
    redirect_to root_path, alert: 'Accès non autorisé' unless Current.user&.admin?
  end
end