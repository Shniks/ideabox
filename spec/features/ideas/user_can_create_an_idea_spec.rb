require 'rails_helper'

describe 'User visits the /ideas/new page' do
  describe 'They can fill in details for an idea and click submit' do
    scenario 'They can see that idea\'s details on the idea show page' do

      visit new_idea_path

      fill_in 'idea[title]', with: 'Sample Idea'
      fill_in 'idea[description]', with: 'Sample Description'

      click_on 'Submit Idea'

      expect(current_path).to eq(ideas_path)
      expect(page).to have_content('Sample Idea')
      expect(page).to have_content('Sample Description')
    end
  end
end
