class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_rich_text :body
  has_many :noticed_events, as: :record, dependent: :destroy, class_name: "Noticed::Event"
#  has_many :notification_mentions, as: :record, dependent: :destroy, class_name: "Noticed::Event"

  after_create_commit :notify_recipient
  #before_destroy :cleanup_notifications

  private
  def notify_recipient
    CommentNotifier.with(comment: self, post: post).deliver_later(post.user)
  end


  #def cleanup_notifications
  #  notifications_as_comment.destroy_all
  #end

end
