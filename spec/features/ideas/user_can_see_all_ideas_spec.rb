require 'rails_helper'

describe 'User visits the ideas index' do
  scenario 'They can a list of all the ideas' do
    user = User.create!(username: 'Nikhil', password: 'password')
    allow_any_instance_of(ApplicationController).
    to receive(:current_user).and_return(user)

    category_1 = Category.create!(name: 'Photography')
    category_2 = Category.create!(name: 'Dancing')

    idea_1 = user.ideas.create!(title: 'Uno', description: 'Great Idea', category: category_1)
    idea_2 = user.ideas.create!(title: 'Dos', description: 'Photos Description', category: category_2)
    idea_3 = user.ideas.create!(title: 'Tres', description: 'More Photos Description', category: category_1)

    visit ideas_path

    expect(current_path).to eq(ideas_path)
    expect(page).to have_content(idea_1.title)
    expect(page).to have_content(idea_2.title)
    expect(page).to have_content(idea_3.title)
  end
end
