require 'rails_helper'

RSpec.describe ClockInService::Index do
  describe '.call' do
    let(:current_user) { create(:user) }
    let!(:clock_ins) { create_list(:clock_in, 5, user: current_user) } 
    
    context 'when calling index' do
      before do
        @clock_ins = ClockInService::Index.call(current_user)
      end

      it 'should list all clock in by the user' do
        expect(@clock_ins.count).to eq(5)
      end
    end
  end
end
