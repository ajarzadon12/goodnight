require 'rails_helper'

RSpec.describe ClockIn, type: :model do
  let!(:clock_in1) { create(:clock_in, clock_type: 'sleep', created_at: Date.today - 8.days) } 
  let!(:clock_in2) { create(:clock_in, clock_type: 'wake_up', created_at: Date.today - 7.days) }
  let!(:clock_in3) { create(:clock_in, clock_type: 'sleep', created_at: Date.today - 6.days) }

  describe "#between" do
    it 'shows within the specified dates' do
      expect(ClockIn.between(Date.today - 8.days, Date.today).count).to eq(3)
    end
  end

  describe "#sleep" do
    it 'shows only clock ins with clock type sleep' do
      expect(ClockIn.sleep.count).to eq(2)
    end
  end

  describe "#wake_up" do
    it 'shows only clock ins with clock type wake_up' do
      expect(ClockIn.wake_up.count).to eq(1)
    end
  end
end
