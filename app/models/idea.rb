class Idea < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :user_id }
  validates :description, presence: true

  belongs_to :category
  belongs_to :user
  has_many :hyperlinks, dependent: :destroy
  has_many :images, through: :hyperlinks, dependent: :destroy
end
