require 'rails_helper'

RSpec.describe Hyperlink, type: :model do
  describe 'Relationships' do
    scenario { should belong_to(:idea) }
    scenario { should belong_to(:image) }
  end
end
