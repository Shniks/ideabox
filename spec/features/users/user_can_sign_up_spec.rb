require 'rails_helper'

describe 'User visits the root page' do
  scenario 'They can sign up to be a user' do

    visit '/'

    click_on "Sign Up to be a User"

    expect(current_path).to eq(new_user_path)

    fill_in 'user[username]', with: 'testname'
    fill_in 'user[password]', with: 'testpassword'

    click_on 'Create User'

    expect(page).to have_content('Welcome, testname!')
  end
end
