FactoryBot.define do
  factory :like do
    user_id { 1 }
    reservation_id { 1 }
    association :reservation
  end
end
