require 'rails_helper'

RSpec.describe UserService::Unfollow do
  describe '.call' do
    let(:current_user) { create(:user) }
    let(:user2) { create(:user) }
    let(:no_user) { nil }
    
    context 'when user to follow exists' do
      before do
        @follow = UserService::Unfollow.call(current_user, user2.id)
      end

      it 'should succeed' do
        expect(@follow[:success]).to be_truthy
      end

      it 'should remove follow for current user to user 2' do
        expect(current_user.following?(user2)).to be_falsey
      end
    end

    context 'when user to follow does not exist' do
      before do
        @follow = UserService::Follow.call(current_user, no_user)
      end

      it 'should fail' do
        expect(@follow[:success]).to be_falsey
      end
    end
  end
end

