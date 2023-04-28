class NotificationsController < ApplicationController
  
    def index
      @notifications = Notification.all
      @progams = Program.all
      @courses = Course.all
    end

    def show
      @program = Program.find(params[:id])
      @courses = @program.courses.joins(:courses_programs).select("courses.*, courses_programs").distinct
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