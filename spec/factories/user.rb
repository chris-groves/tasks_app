FactoryBot.define do
  factory :user do
    name { "Chris" }
    email { "me@example.com"}
    password { "foobar" }
    password_confirmation { "foobar" }
  end
end
