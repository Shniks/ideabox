class Image < ApplicationRecord
  validates :url, :name, presence: true

  has_many :hyperlinks
  has_many :ideas, through: :hyperlinks
end
