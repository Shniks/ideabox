class Image < ApplicationRecord
  validates :url, presence: true

  has_many :hyperlinks
  has_many :ideas, through: :hyperlinks
end
