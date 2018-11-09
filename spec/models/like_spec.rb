require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'when validating associations' do
    it 'belongs to book' do
      should belong_to(:book)
    end
  end

  context 'when validating specific methods' do
    let(:category_attibutes) do
      {name: Faker::Book.genre.truncate(15)}
    end
    let(:book_attributes) do
      { title: Faker::Book.title,
        published_at: Faker::Date.backward(10),
        text: Faker::Lorem.paragraph }
    end
    let(:category) {Category.create(category_attibutes)}
    let(:book) {Book.create(book_attributes)}
    describe "#add_likes_to_category" do
      context 'when there is one category' do
        before do
          book.categories << category
        end
        context 'and there is one like' do
          before do
            Like.create book_id: book.id
          end
          subject{Category.first.likes}
          it 'returns number of likes correctly' do
            expect(subject).to eql(1)
          end
        end
        context 'and there is more than one like' do
          before do
            3.times{Like.create book_id: book.id}
          end
          subject{Category.first.likes}
          it 'returns number of likes correctly' do
            expect(subject).to eql(3)
          end
        end
      end
    end
  end
end
