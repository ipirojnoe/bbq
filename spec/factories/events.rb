FactoryBot.define do
  factory :event do
    association :user

    sequence(:title) { |n| "Событие #{n}" }
    sequence(:description) { |n| "Описание #{n}" }
    address { 'Санкт-Петербург' }
    datetime { Time.parse('01.03.21 06:00') }
  end
end
