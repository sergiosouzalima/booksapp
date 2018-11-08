# frozen_string_literal: true

50.times do
  Book.create(
    title: Faker::Book.title,
    published_at: Faker::Date.backward(10),
    text: Faker::Lorem.paragraph
  )
end
