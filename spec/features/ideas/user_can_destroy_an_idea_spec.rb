require 'rails_helper'

describe 'User visits ideas index' do
  describe 'They click the delete button next to an idea' do
    scenario 'The idea is removed from the ideas index' do
      user = User.create!(username: 'Nikhil', password: 'password')
      allow_any_instance_of(ApplicationController).
      to receive(:current_user).and_return(user)

      category_1 = Category.create!(name: 'Photography')
      category_2 = Category.create!(name: 'Dancing')

      idea = user.ideas.create!(title: 'Save Photos', description: 'Save Photos Description', category: category_1)

      visit ideas_path

      within(".idea_#{idea.id}") do
        click_link 'Delete'
      end

      expect(current_path).to eq(ideas_path)
    end
  end
end
