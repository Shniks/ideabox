class Idea < ApplicationRecord
  validates :title, :description, presence: true, uniqueness: true
  belongs_to :category
end
