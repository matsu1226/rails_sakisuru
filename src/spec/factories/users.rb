FactoryBot.define do
  factory :user do
    name                  { "正太郎" }
    email                 { "shotaro@example.com" }
    password              { "example01" }
    password_confirmation { "example01" }
    birthday              { Date.new(1991, 11, 26) }

    factory :user2 do
      name { "健太" }
      email { "kenta@example.com" }
    end
  end
end
