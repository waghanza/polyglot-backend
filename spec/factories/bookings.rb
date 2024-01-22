FactoryBot.define do
  factory :booking do
    start_at { '2024-01-16 11:33:18' }
    driver { nil }
    from { 'MyString' }
    to { 'MyString' }
  end
end
