require 'rails_helper'

describe 'User visits the new idea path to create a new idea' do
  describe 'They can fill in details for an idea and click submit' do
    scenario 'They can see that new idea\'s details on the ideas index page' do

      category = Category.create!(name: 'Photography')

      visit new_idea_path

      save_and_open_page

      fill_in 'idea[title]', with: 'Sample Idea'
      fill_in 'idea[description]', with: 'Sample Description'

      click_on 'Create Idea'

      expect(current_path).to eq(ideas_path)
      expect(page).to have_content('Sample Idea')
      expect(page).to have_content('Sample Description')
    end
  end
end
