require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'when validating attributes' do
    context 'when name' do
      it 'is mandatory' do
        should validate_presence_of(:name)
      end
      it 'has 15 characters at most' do
        should validate_length_of(:name).is_at_most(15)
      end
    end
  end
end
