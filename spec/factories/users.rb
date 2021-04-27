FactoryBot.define do
  factory :user do
    sequence(:email){|i| "name#{i}@example.com"}
    sequence(:password){|i| "password" }
    sequence(:password_confirmation){|i| "password" }
    
    name {"takehiro kawashita"}
    point { 0 }
    birthday { "1992/12/21" }
    address { "xxxxxxxxxxxxxxxxxx" }
    sex { "male" }
    
  end
end