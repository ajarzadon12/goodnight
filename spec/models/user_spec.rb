require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#week_clock_ins" do
    let(:user) { create(:user) }
    let!(:clock_in1) { create(:clock_in, user: user, clock_type: 'sleep', created_at: Date.today - 8.days) } 
    let!(:clock_in2) { create(:clock_in, user: user, clock_type: 'wake_up', created_at: Date.today - 7.days) }
    let!(:clock_in3) { create(:clock_in, user: user, clock_type: 'sleep', created_at: Date.today - 6.days) }

    it 'shows only clock ins within a week' do
      expect(user.week_clock_ins(Date.today).count).to eq(2)
    end
  end
end
