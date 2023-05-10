=begin
ApplicationController is the controller dedicated to the application. We use it for the Devise and CanCanCan checks ensuring that Devise forces user authentication and CanCan redirects to root if a user cannot access a certain page.
Our controllers derive from this controller.
=end
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Disabling caching will prevent sensitive information being stored in the
  # browser cache. If your app does not deal with sensitive information then it
  # may be worth enabling caching for performance.
  before_action :update_headers_to_disable_caching

  before_action :authenticate_user!

  #  When a user that does not have permissions attempts to login to a certain page, this prevents the exception that is raised from showing the error page
  # and instead redirects to the root page with the exception error message
  rescue_from CanCan::AccessDenied do |exception|
    redirect_back(fallback_location: root_path, alert: exception.message)
  end

  rescue_from ZeroDivisionError do |exception|
    render template: "errors/error_page"
  end

  private
    # update_headers_to_disable_caching sets the response.headers to prevent problems like caching
    def update_headers_to_disable_caching
      response.headers['Cache-Control'] = 'no-cache, no-cache="set-cookie", no-store, private, proxy-revalidate'
      response.headers['Pragma'] = 'no-cache'
      response.headers['Expires'] = '-1'
    end
end
