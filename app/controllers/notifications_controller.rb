class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications
    @new_notifications = @notifications.where(viewed: false)
    @new_notifications_count = @new_notifications.count
    @notifications -= @new_notifications
    @new_notifications.each do |n|
      n.update(viewed: true)
    end
  end

end
