class NotificationsController < ApplicationController
    before_action :authenticate_user!

    def index
        @notifications = current_user.notifications.includes(event: :record)
# Other logic for displaying notifications
    end




end
