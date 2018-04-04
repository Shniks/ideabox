require 'rails_helper'

describe 'Admin visits a new image path to create a new image' do
  describe 'They can fill in the details for a new cimage and click submit' do
    scenario 'They can see the new image\'s details on the images index page' do
      user = User.create(username: 'Nikhil', password: 'password', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_image_path

      fill_in 'image[name]', with: 'Awesome Image'
      fill_in 'image[url]', with: 'http://www.sampleimage.com'

      click_on 'Create Image'

      expect(current_path).to eq(images_path)
      expect(page).to have_content('Awesome Image')
    end
  end
end

describe 'Current User visits a new image path to create a new image' do
  scenario 'They get a 404 error and cannot see the images index' do
    user = User.create(username: 'Nikhil', password: 'password', role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_image_path

    expect(current_path).to eq(new_image_path)
    expect(page).to have_content('404')
  end
end

describe 'Anonymous User visits a new category path to create a new image' do
  scenario 'They get a 404 error and cannot see the images index' do
    user = User.create(username: 'Nikhil', password: 'password', role: 0)

    visit new_image_path

    expect(current_path).to eq(new_image_path)
    expect(page).to have_content('404')
  end
end
