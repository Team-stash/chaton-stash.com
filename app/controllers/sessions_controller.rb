class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Rééssayer plus tard" }

  def new
  end

  def create
    if user = User.authenticate_by(params.permit(:email_address, :password))
      start_new_session_for user
      redirect_to after_authentication_url, notice: "Connexion réussie !"
    else
      redirect_to new_sessions_path, alert: "Email ou mot de passe invalide"
    end
  end

  def destroy
    terminate_session
    redirect_to new_sessions_path, notice: "Déconnecté avec succès !"
  end
end
