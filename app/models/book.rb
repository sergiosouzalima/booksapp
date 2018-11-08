class Book < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :published_at, presence: true
  validates :text, presence: true
end
