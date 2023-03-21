require 'rails_helper'

RSpec.describe ClockInService::Create do
  describe '.call' do
    context 'when calling create' do
      let(:current_user) { create(:user) }
      let(:clock_in) { create(:clock_in, user: current_user) } 

      before do
        @expected = clock_in.clock_type == 'sleep' ? 'wake_up' : 'sleep'
        @clock_in = ClockInService::Create.call(current_user)
      end

      it 'should create a clock in for the user' do
        expect(current_user.clock_ins.count).to eq(2)
      end

      it 'should toggle clock in type' do
        expect(current_user.clock_ins.last.clock_type).to eq(@expected)
      end
    end
  end
end
