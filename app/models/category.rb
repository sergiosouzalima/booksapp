# == Schema Information
#
# Table name: categories
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  likes      :integer          default(0)
#

class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }

  scope :ordered_by_name, -> { order(name: :asc) }

  has_and_belongs_to_many :books
end
