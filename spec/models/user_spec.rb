require "rails_helper"

describe User, type: :model do
  describe "Validations" do
    it "Presence of username" do
      user = User.new(password: "Password")

      expect(user).to_not be_valid
    end

    it "Uniqueness of username" do
      User.create(username: "user", password: "Password")
      copy_cat = User.new(username: "user", password: "Password")

      expect(copy_cat).to_not be_valid
    end
  end
end
