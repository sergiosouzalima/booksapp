# frozen_string_literal: true
15.times do
  Category.create( name: Faker::Book.genre )
end

40.times do
  Book.create(
    title: Faker::Book.title,
    published_at: Faker::Date.backward(10),
    text: Faker::Lorem.paragraph
  )
end
