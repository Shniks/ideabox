require 'rails_helper'

describe 'User visits the home page' do
  describe 'They click on I already have an account' do
    describe 'They get taken to a login page where they fill their details and click on Log In' do
      scenario 'They are logged in and taken to the welcome page' do

        user = User.create(username: "funbucket13", password: "test")

        visit '/'
        click_on 'Log In'

        expect(current_path).to eq(login_path)

        fill_in 'username', with: user.username
        fill_in 'password', with: user.password

        click_button 'Log In'

        expect(current_path).to eq(user_path(user))
        expect(page).to have_content("Welcome, #{user.username}!")
        expect(page).to have_link('Log Out')
      end
    end
  end
end
