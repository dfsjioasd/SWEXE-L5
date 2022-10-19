class Tweet < ApplicationRecord
    validates :message , presence: true
    validates :message, length: { maximum: 140 }
    has_many :likes
    has_many :like_users, through: :likes, source: :user
    belongs_to :user
    
    def like(user)
        likes.create(user_id: user.id)
    end
    
    def unlike(user)
        likes.find_by(user_id: user.id).destroy
    end
    
    def liked?(user) #いいね済みか調べる(true / false)
        like_users.include?(user)
    end
end