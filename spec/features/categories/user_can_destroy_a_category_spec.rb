require 'rails_helper'

describe 'User visits categories index' do
  describe 'They click the delete button next to category' do
    scenario 'The category is removed from the categories index' do

      category = Category.create!(name: 'Photography')

      visit categories_path

      within(".category_#{category.id}") do
        click_link 'Delete'
      end

      expect(page).to_not have_content(category.title)
    end
  end
end
