FactoryBot.define do
  factory :project do
    title { "MyString" }
    user { "" }
    client { "MyString" }
    budget { 1 }
    due_date { "2022-05-16" }
  end
end
