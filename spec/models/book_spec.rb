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
end
