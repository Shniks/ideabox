equire 'rails_helper'

describe 'Admin visits the images index' do
  describe 'They click the delete button next to the image' do
    scenario 'The image is removed from the images index' do
      user = User.create(username: 'Nikhil', password: 'password', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)


      image = Image.create(name: 'Test Photo', url: 'www.testphoto.com/test.jpg')

      visit images_path

      within(".image_#{image.id}") do
        click_link 'Delete'
      end

      expect(page).to_not have_content(image.name)
    end
  end
end
