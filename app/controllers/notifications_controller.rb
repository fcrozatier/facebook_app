class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications.order(created_at: :desc)
    @new_notifications = @notifications.where(viewed: false)
    @new_notifications_count = @new_notifications.count
    @cutoff_date = DateTime.now
    if @new_notifications_count > 0
      @cutoff_date = @new_notifications.last.created_at
    end
    @new_notifications.each do |n|
      n.update(viewed: true)
    end
  end

end
