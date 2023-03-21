FactoryBot.define do
  factory :clock_in do
    clock_type { rand(2) }
    user { create(:user) }
  end
end
