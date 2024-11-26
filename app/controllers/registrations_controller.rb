class RegistrationsController < ApplicationController

  allow_unauthenticated_access

  def new
    @user = User.new
  end

  def create
    
    @user = User.new(user_params)
    if @user.save
      start_new_session_for(@user)
      redirect_to root_path, notice: "Insciption Réussie"
    else
      render :new, status: :unprocessable_entity
    end
  end


  def user_params
    
    params.permit(:email_address, :password, :password_confirmation, :first_name, :last_name)
  end
end