class Image < ApplicationRecord
  has_many :hyperlinks
  has_many :ideas, through: :hyperlinks
end
