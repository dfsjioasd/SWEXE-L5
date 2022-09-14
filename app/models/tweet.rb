class Tweet < ApplicationRecord
    validates :message , presence: true
    validates :message, length: { maximum: 20 }
end