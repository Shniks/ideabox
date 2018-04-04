require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'Validations' do
    scenario { validate_presence_of :url }
    scenario { validate_presence_of :name }
  end

  describe 'Relationships' do
    scenario { should have_many(:hyperlinks) }
    scenario { should have_many(:ideas).through(:hyperlinks) }
  end
end
