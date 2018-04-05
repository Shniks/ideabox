require 'rails_helper'

describe 'User visits the new idea path to create a new idea' do
  describe 'They can fill in details for an idea and click submit' do
    scenario 'They can see that new idea\'s details on the ideas index page' do
      user = User.create(username: 'Nikhil', password: 'password')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      Category.create!(name: 'Photography')
      Category.create!(name: 'Dancing')


      visit new_idea_path

      fill_in 'idea[title]', with: 'Sample Idea'
      fill_in 'idea[description]', with: 'Sample Description'
      select 'Dancing', from: 'idea[category_id]'

      click_on 'Create Idea'

      expect(current_path).to eq(ideas_path)
      expect(page).to have_content('Sample Idea')
    end
  end
end
