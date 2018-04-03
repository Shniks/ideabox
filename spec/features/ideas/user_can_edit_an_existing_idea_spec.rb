require 'rails_helper'

describe 'User visits the edit path for an existing idea' do
  scenario 'They can edit the details for that idea' do

    category_1 = Category.create!(name: 'Photography')
    category_2 = Category.create!(name: 'Dancing')

    idea = Idea.create!(title: 'Save Photos', description: 'Save Photos Description', category:
    category_2)

    visit edit_idea_path(idea)

    fill_in 'idea[title]', with: 'Stack Tripods'
    fill_in 'idea[description]', with: 'Stack Tripods Description'
    select 'Photography', from: 'idea[category_id]'
    click_on 'Update Idea'

    expect(current_path).to eq(ideas_path)
    expect(page).to have_content('Stack Tripods')
    expect(page).to have_content(category_1.name)
  end
end
