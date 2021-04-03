FactoryBot.define do
    factory :lesson do
      
      title { "Body Pump" }
      level { 1 }
      category {"脂肪燃焼"}
      started_at { "2021/01/01 00:00" }
      description { "xxxxxxxxxxxxxxxxxx" }
      price { 1000 }
      instructor {"川下"}
      limits {10}

    end 
end