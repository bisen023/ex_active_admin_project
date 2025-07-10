require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  # subject {AdminUser.new(email: "satyam@example.com", password: "Satyam@123", password_confirmation: "Satyam@123")}
    
  let(:admin_user) {build (:admin_user)}
  it "is valid with valid attributes" do
    expect(admin_user).to be_valid
  end

  it "is not valid without a email" do
    admin_user.email = nil
    expect(admin_user).to_not be_valid
    expect(admin_user.errors[:email]).to include("can't be blank")
  end

  it "is not valid without a password" do
    admin_user.password = nil
    expect(admin_user).to_not be_valid
    expect(admin_user.errors[:password]).to include("can't be blank")
  end

  it "is not valid without a password_confirmation" do
    admin_user.password_confirmation = "satyam"
    expect(admin_user).to_not be_valid
    expect(admin_user.errors[:password_confirmation]).to include("doesn't match Password")
  end

  it "is not valid without a mobile_no" do
    admin_user.mobile_no = nil
    expect(admin_user).to_not be_valid
    expect(admin_user.errors[:mobile_no]).to include("can't be blank")
  end

  it "is not valid without a characters" do
    admin_user.mobile_no = "1212aa"
    expect(admin_user).to_not be_valid
    expect(admin_user.errors[:mobile_no]).to include("is the wrong length (should be 10 characters)")
  end 


end
