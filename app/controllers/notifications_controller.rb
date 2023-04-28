class NotificationsController < ApplicationController
  

    def index
      @notifications = Notification.all.order("created_at desc")
      @progam = Program.all
      @course = Course.all
    end
end