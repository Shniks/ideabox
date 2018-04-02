class Idea < ApplicationRecord
  validates :title, :description, presence: true, uniqueness: true
end
