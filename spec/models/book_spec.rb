require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'when validating attributes' do
    context 'when title' do
      it 'is mandatory' do
        should validate_presence_of(:title)
      end
      it 'has 100 characters at most' do
        should validate_length_of(:title).is_at_most(100)
      end
    end
    context 'when published_at' do
      it 'is mandatory' do
        should validate_presence_of(:published_at)
      end
    end
    context 'when text' do
      it 'is mandatory' do
        should validate_presence_of(:text)
      end
    end
  end

  context 'when validating associations' do
    it 'has and belongs to many categories' do
      should have_and_belong_to_many(:categories)
    end
    it 'has many likes, destroy dependents' do
      should have_many(:likes).dependent(:destroy)
    end
  end

  context 'when validating specific methods' do
    describe "#likes_count" do
      before do
        book_attributes = { title: Faker::Book.title,
                            published_at: Faker::Date.backward(10),
                            text: Faker::Lorem.paragraph
        }
        book = Book.create(book_attributes)
        Like.create book_id: book.id
      end
      subject{ Book.first.likes_count }
      let(:book_likes){ Book.first.likes.count }
      it 'returns number of likes correctly' do
        expect(subject).to eql(book_likes)
      end
    end
  end
end
