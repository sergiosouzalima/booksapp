# frozen_string_literal: true
25.times do
  Category.create( name: Faker::Book.genre )
end

50.times do
  # categories_array = Category.all.pluck(:id).shuffle.take(rand(0..5))
  book_attributes = { title: Faker::Book.title,
                      published_at: Faker::Date.backward(10),
                      text: Faker::Lorem.paragraph
  }
  book = Book.create(book_attributes)
  book.categories << Category.all.shuffle.take(rand(0..5))
end
