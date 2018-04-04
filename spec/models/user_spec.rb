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

  describe "Roles" do
    it "Can be created as an admin" do
      user = User.create(username: "penelope", password: "boom", role: 1)

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end

    it "Can be created as a default user" do
      user = User.create(username: "sammy", password: "pass", role: 0)

      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end
  end
end
