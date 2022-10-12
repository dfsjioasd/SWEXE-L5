class Tweet < ApplicationRecord
    validates :message , presence: true
    validates :message, length: { maximum: 140 }
    has_many :likes
    has_many :like_users, through: :likes, source: :user
end