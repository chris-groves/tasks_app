FactoryBot.define do
  factory :task do
    description { "Read a book" }
    user
  end
end
