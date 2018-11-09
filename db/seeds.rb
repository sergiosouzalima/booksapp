# frozen_string_literal: true
9.times do
  Category.where( name: Faker::Book.genre ).first_or_create
end

50.times do
  book_attributes = { title: Faker::Book.title,
                      published_at: Faker::Date.backward(10),
                      text: Faker::Lorem.paragraph
  }
  book = Book.create(book_attributes)
  book.categories << Category.all.shuffle.take(rand(0..5))
  rand(0..4).times do
    Like.create book_id: book.id
  end
end
