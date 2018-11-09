# == Schema Information
#
# Table name: books
#
#  id           :bigint(8)        not null, primary key
#  title        :string
#  published_at :date
#  text         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Book < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :published_at, presence: true
  validates :text, presence: true

  has_and_belongs_to_many :categories
  has_many :likes, dependent: :destroy

  scope :by_title, -> { order(title: :asc) }

  def likes_count
    likes.count
  end
end
