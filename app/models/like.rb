# == Schema Information
#
# Table name: likes
#
#  id         :bigint(8)        not null, primary key
#  book_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ApplicationRecord
  after_create_commit :add_likes_to_category

  belongs_to :book

  def add_likes_to_category
    self.book.categories.each do |e|
      Category.find(e.id).update(likes: e.likes + 1)
    end
  end
end
