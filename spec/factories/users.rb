FactoryBot.define do
  factory :user, class: 'User' do
    sequence(:email) { |i| "email#{i}@email.com" }
    password '123!@#$GGGddd'
  end
end
