class Admin::NotificationsController < Admin::ApplicationController
  def index
    @visitor_notifications = Notifications.where(notifiable_type: 'Visitor').order(id: :desc)
    @comment_notifications = Notifications.where(notifiable_type: 'Comment').order(id: :desc)
  end

  def destroy
  end
end
