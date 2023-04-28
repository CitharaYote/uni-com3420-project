class NotificationsController < ApplicationController
  before_action :set_notification, only: %i[ show edit update destroy redirect]

    def index
      @notifications = Notification.all
    end

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
      params.require(:notification).permit(:id, :identifier, :alert)
    end
end