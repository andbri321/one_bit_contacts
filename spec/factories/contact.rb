FactoryBot.define do
  factory :random_contacts, class: Contact do
      user {FactoryBot.create(:user)}
      name { 'n1' }
      phone { Faker::Number.between(1, 2) }
  end
end