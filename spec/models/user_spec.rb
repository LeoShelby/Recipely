require 'rails_helper'


RSpec.describe User, :type => :model do

  it "valid user" do
   valid_user  = User.new(name: "Angelo", password: "password", email: "ang@gmail.com")
    expect(valid_user.valid?).to eq(true)
 
  end
  it "invalid user--password too short" do
   invalid_user  = User.new(name: "Franco", password: "short",email: "fra@gmail.com")
    expect(invalid_user.valid?).to eq(false)
  end
  
  it "invalid user--name no blank" do
   invalid_user  = User.new(name: "", password: "password",email: "fra@gmail.com")
    expect(invalid_user.valid?).to eq(false)
  end
  it "invalid user--email no blank" do
   invalid_user  = User.new(name: "Angelo", password: "password",email: "")
    expect(invalid_user.valid?).to eq(false)
  end
end
