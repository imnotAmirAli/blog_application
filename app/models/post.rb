class Post < ApplicationRecord

    validates :title, presence: true, length: {minimum:5, maximum: 50}
    validates :body, presence: true
    
    has_rich_text :body
    has_one :content, class_name: 'ActionText::RichText', as: :record, dependent: :destroy

    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :notifications, through: :user

    
end
 