# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    puts "\n\n\n\n\n\n\n\n #{check_if_staff?}\n\n\n\n\n\n\n\n\n"
    if check_if_staff?
      super
    else
      redirect_to new_user_session_path, alert: "User is not a Staff"
    end

  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  
  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  
  private
  def check_if_staff?
    username = params[:user][:username]
    
    staff ||= Staff.find_by(username: username)
    
    staff.present?
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
