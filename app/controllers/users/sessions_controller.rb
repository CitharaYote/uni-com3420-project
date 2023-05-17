# frozen_string_literal: true

# SessionsController made to check that users attempting to log in do not just meet EpiCAS requirements of having a university login but also are registered staff.
# Made to prevent unauthorised staff and students from logging in.

module Users
  class SessionsController < Devise::SessionsController
    # create is forced when a Session is made, it runs the check to ensure a user is in our Staff ActiveRecord or provokes access
    # POST /resource/sign_in
    def create
      if check_if_staff?
        super
      else
        redirect_to new_user_session_path, alert: 'User is not a Staff'
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

    # check_if_staff takes the user paramaters (in importance the username) and checks it against the Staff database, returning a boolean result as to whether the person is in the staff database
    def check_if_staff?
      username = params[:user][:username]

      staff ||= Staff.find_by(username:)

      staff.present?
    end

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
  end
end
