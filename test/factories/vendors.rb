FactoryBot.define do
  factory :vendor do
    name { "MyString" }
    age { 1 }
    gender { "MyString" }
    race { "MyString" }
    height { 1 }
    weight { 1 }
    user { nil }
  end
end
