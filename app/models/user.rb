class User < ApplicationRecord
  acts_as_followable
  acts_as_follower

  validates :name, presence: true
end
