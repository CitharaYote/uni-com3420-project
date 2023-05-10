=begin
  NotificationsController is used to provide framework for the Notifications ActiveRecord. The notifications to inform users of changes and updates to activerecords like
  Students, Program and Courses.
=end
class NotificationsController < ApplicationController
  before_action :set_notification, only: %i[ show edit update destroy redirect]
  authorize_resource

    #Index provides the erb and haml files with all notifications that include :course variable
    def index
      
      @notifications = Notification.includes(:course).all

    end

    #destroy takes the provided notification (@notification) and destroys it
    def destroy
      @notification.destroy
      redirect_to notifications_url, notice: "Notification was successfully deleted."
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notification_params
      params.require(:notification).permit(:id, :identifier, :alert, :course)
    end
end