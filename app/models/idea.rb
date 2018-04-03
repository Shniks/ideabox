class Idea < ApplicationRecord
  validates :title, :description, presence: true, uniqueness: true

  belongs_to :category
  has_many :hyperlinks
  has_many :images, through: :hyperlinks
end
