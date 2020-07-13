FactoryBot.define do
  factory :user do
      sequence(:email) { |n| "test-#{n.to_s.rjust(3,"0")}@sample.com"}
      password { '123123' }
      authentication_token { rand(36**8).to_s(30) }      
  end
end