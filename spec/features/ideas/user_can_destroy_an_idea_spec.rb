require 'rails_helper'

describe 'User visits ideas index' do
  describe 'They click the delete button next to an idea' do
    scenario 'The idea is removed from the ideas index' do

      idea = Idea.create!(title: 'Save Photos', description: 'Save Photos Description')

      visit ideas_path

      within(".idea_#{idea.id}") do
        click_link 'Delete'
      end

      expect(page).to_not have_content(idea.title)
      expect(page).to_not have_content(idea.description)
    end
  end
end
