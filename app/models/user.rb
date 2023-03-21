class User < ApplicationRecord
  acts_as_followable
  acts_as_follower

  validates :name, presence: true

  has_many :clock_ins, dependent: :destroy

  def week_clock_ins(date)
    clock_ins.between(date - 7.day, date).order(created_at: :asc)
  end
end
