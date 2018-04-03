require 'rails_helper'

describe 'User visits the ideas index' do
  scenario 'They can a list of all the ideas' do

    idea_1 = Idea.create!(title: 'Uno', description: 'Great Idea')
    idea_2 = Idea.create!(title: 'Dos', description: 'Photos Description')
    idea_3 = Idea.create!(title: 'Tres', description: 'More Photos Description')

    visit ideas_path

    expect(current_path).to eq(ideas_path)
    expect(page).to have_content(idea_1.title)
    expect(page).to have_content(idea_1.description)
    expect(page).to have_content(idea_2.title)
    expect(page).to have_content(idea_2.description)
    expect(page).to have_content(idea_3.title)
    expect(page).to have_content(idea_3.description)
  end
end
