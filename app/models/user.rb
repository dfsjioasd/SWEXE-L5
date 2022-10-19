class User < ApplicationRecord
    validates :uid, presence:true
    validates :password, presence:true, confirmation: true
    has_many :likes
    has_many :like_tweets, through: :likes, source: :tweet
    has_one :tweet
    attr_accessor :password, :password_confirmation

    def password=(val)
        if val.present?
         self.pass = BCrypt::Password.create(val)
        end
        @password = val
    end
end
