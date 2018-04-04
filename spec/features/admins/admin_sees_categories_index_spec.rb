require "rails_helper"

describe "User visits categories index page" do
  context "As an admin" do
    it "Allows admin to see all categories" do
	    admin = User.create(username: "penelope", password: "boom", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      expect(page).to have_content("Admin Categories")
    end
  end

  context "As a default user" do
    it 'Does not allow default user to see admin categories index' do
      user = User.create(username: "fern@gully.com", password: "password", role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_categories_path

      expect(page).to_not have_content("Admin Categories")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
