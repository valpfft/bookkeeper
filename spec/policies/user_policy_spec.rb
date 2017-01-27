require "rails_helper"

describe UserPolicy do
  subject { UserPolicy }

  let (:current_user) { FactoryGirl.build_stubbed :user }
  let (:another_user) { FactoryGirl.build_stubbed :user }
  let (:admin) { FactoryGirl.build_stubbed :user, :admin }

  permissions :index? do
    it "denies access when not an admin" do
      expect(UserPolicy).not_to permit(current_user)
    end

    it "allow access when an admin" do
      expect(UserPolicy).to permit(admin)
    end
  end

  permissions :show? do
    it "prevent other users from seeing current profile" do
      expect(subject).not_to permit(current_user, another_user)
    end

    it "allows owner to see current profile" do
      expect(subject).to permit(current_user, current_user)
    end

    it "allows admin to see current profile" do
      expect(subject).to permit(admin)
    end
  end

  permissions :update? do
    it "allows an admin to make updates" do
      expect(subject).to permit(admin)
    end

    it "prevent updates if not an admin" do
      expect(subject).not_to permit(current_user)
    end
  end

  permissions :destroy? do
    it "prevent delete any user if not an admin" do
      expect(subject).not_to permit(current_user, another_user)
    end

    it "prevent deleting yourself" do
      expect(subject).not_to permit(current_user, current_user)
    end

    it "allows and admin to delete any user" do
      expect(subject).to permit(admin)
    end
  end
end
