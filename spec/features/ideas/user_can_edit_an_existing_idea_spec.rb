require 'rails_helper'

describe 'User visits the edit path for an existing idea' do
  scenario 'They can edit the details for that idea' do

    idea = Idea.create!(title: 'Save Photos', description: 'Save Photos Description')

    visit edit_idea_path(idea)

    fill_in 'idea[title]', with: 'Stack Tripods'
    fill_in 'idea[description]', with: 'Stack Tripods Description'
    click_on 'Update Idea'

    expect(current_path).to eq(ideas_path)
    expect(page).to have_content('Stack Tripods')
    expect(page).to have_content('Stack Tripods Description')
  end
end
