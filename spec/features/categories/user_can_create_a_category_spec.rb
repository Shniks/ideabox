require 'rails_helper'

describe 'User visits a new category path to create a new category' do
  describe 'They can fill in the details for a new category and click submit' do
    scenario 'They can see the new category\'s details on the categories index page' do

      visit new_category_path

      fill_in 'category[name]', with: 'Sample Category'

      click_on 'Create Category'

      expect(path).to eq(categories_path)
      expect(page).to have_content('Sample Category')
    end
  end
end
