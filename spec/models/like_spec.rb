require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'when validating associations' do
    it 'belongs to book' do
      should belong_to(:book)
    end
  end
end
