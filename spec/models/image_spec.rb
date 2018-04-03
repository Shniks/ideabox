require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'Validations' do
    scenario { validate_presence_of :url }
  end

  describe 'Relationships' do
    scenario { should have_many(:ideas) }
    scenario { should have_many(:ideas).through(:imaging) }
  end
end
