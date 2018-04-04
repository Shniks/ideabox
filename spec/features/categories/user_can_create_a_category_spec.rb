require 'rails_helper'

describe 'Admin visits a new category path to create a new category' do
  describe 'They can fill in the details for a new category and click submit' do
    scenario 'They can see the new category\'s details on the categories index page' do
      user = User.create(username: 'Nikhil', password: 'password', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_category_path

      fill_in 'category[name]', with: 'Sample Category'

      click_on 'Create Category'

      expect(current_path).to eq(categories_path)
      expect(page).to have_content('Sample Category')
    end
  end
end

describe 'Current User visits a new category path to create a new category' do
  scenario 'They get a 404 error and cannot see the categories index' do
    user = User.create(username: 'Nikhil', password: 'password', role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_category_path

    expect(current_path).to eq(new_category_path)
    expect(page).to have_content('404')
  end
end

describe 'Anonymous User visits a new category path to create a new category' do
  scenario 'They get a 404 error and cannot see the categories index' do
    user = User.create(username: 'Nikhil', password: 'password', role: 0)

    visit new_category_path

    expect(current_path).to eq(new_category_path)
    expect(page).to have_content('404')
  end
end
