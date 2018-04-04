require 'rails_helper'

describe 'User visits the categories index' do
  scenario 'They can see a list of all the categories' do
    user = User.create(username: 'Nikhil', password: 'password', role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)


    category_1 = Category.create!(name: 'Photography')
    category_2 = Category.create!(name: 'Knitting')
    category_3 = Category.create!(name: 'Cars')
    category_4 = Category.create!(name: 'Sports')

    visit categories_path

    expect(page).to have_content('Photography')
    expect(page).to have_content('Knitting')
    expect(page).to have_content('Cars')
    expect(page).to have_content('Sports')
  end
end
