require 'rails_helper'

describe 'User visits a categories show page' do
  scenario 'They see a list of all the ideas for that category' do

    category_1 = Category.create!(name: 'Photography')
    category_2 = Category.create!(name: 'Knitting')
    idea_1 = Idea.create!(title: 'Uno', description: 'Great Idea', category: category_1)
    idea_2 = Idea.create!(title: 'Dos', description: 'Photos Description', category: category_2)
    idea_3 = Idea.create!(title: 'Tres', description: 'More Photos Description', category: category_1)

    visit category_path(category_1)

    expect(current_path).to eq(category_path(category_1))
    expect(page).to have_content(idea_1.title)
    expect(page).to have_content(idea_3.title)
    expect(page).to have_content(idea_1.description)
    expect(page).to have_content(idea_3.description)
  end
end
