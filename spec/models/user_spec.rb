require "rails_helper"

describe User, type: :model do
  let(:user) { create(:user) }
  describe "Validations" do
    it "is valid with valid attributes" do
      expect(user).to be_valid
    end

    it "is not valid without a username" do
      user.username = nil
      expect(user).to_not be_valid
    end

    it "is not valid without an email" do
      user.email = nil
        expect(subject).to_not be_valid
      end
        
    it "is not valid without a password" do
      user.password = nil
        expect(subject).to_not be_valid
    end
  end
end
 


