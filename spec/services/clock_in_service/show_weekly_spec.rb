require 'rails_helper'

RSpec.describe ClockInService::ShowWeekly do
  describe '.call' do
    let(:current_user) { create(:user) }
    let(:user2) { create(:user) }
    let(:no_user) { nil }

    let!(:clock_in1) { create(:clock_in, user: user2, clock_type: 'sleep', created_at: Time.now - 20.minute) } 
    let!(:clock_in2) { create(:clock_in, user: user2, clock_type: 'wake_up', created_at: Time.now - 15.minute) } 
    let!(:clock_in3) { create(:clock_in, user: user2, clock_type: 'sleep', created_at: Time.now - 10.minute) } 
    let!(:clock_in4) { create(:clock_in, user: user2, clock_type: 'wake_up', created_at: Time.now - 8.minute) } 

    context 'when current user follows user2' do
      before do
        current_user.follow(user2)
        @clock_ins = ClockInService::ShowWeekly.call(current_user, user2.id)
      end

      it 'should list all paired clock in for the week ordered by duration' do
        expect(@clock_ins[:data].first[:duration]).to eq(120)
      end
    end

    context 'when current user does not follow user2' do
      before do
        @clock_ins = ClockInService::ShowWeekly.call(current_user, user2.id)
      end

      it 'should fail' do
        expect(@clock_ins[:success]).to be_falsey
      end
    end

    context 'when request is for user that does not exist' do
      before do
        @clock_ins = ClockInService::ShowWeekly.call(current_user, no_user)
      end

      it 'should fail' do
        expect(@clock_ins[:success]).to be_falsey
      end
    end
  end
end

