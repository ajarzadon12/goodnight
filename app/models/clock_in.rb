class ClockIn < ApplicationRecord
  belongs_to :user

  validates :clock_type, presence: true

  enum clock_type: { sleep: 0, wake_up: 1 }

  scope :between, ->(sdate, edate) do
    where('created_at >= ? AND created_at <= ?', sdate.to_date.beginning_of_day, edate.to_date.end_of_day)
  end

  scope :sleep, ->{ where(clock_type: 'sleep') }
  scope :wake_up, ->{ where(clock_type: 'wake_up') }
end
