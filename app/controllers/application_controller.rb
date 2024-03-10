class ApplicationController < ActionController::Base
    before_action :set_notifications, if: :current_user
    before_action :set_query

    def set_query
      @query = Post.ransack(params[:q])
    end

    

    private

    def set_notifications
        @unread = current_user.notifications.unread.count
    end

end
