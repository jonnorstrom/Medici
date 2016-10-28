require "rails_helper"

describe ApplicationHelper, type: :helper do
  let(:user){User.create(name:"Corbin Dallas", email: "corbin@dallas.com", password: "multipass", admin: true)}
  let(:user_2){User.create(name:"Lilu", email: "lilu@5th.com", password: "multipass")}

  it "should return true if user is an admin" do
    expect(user.admin?).to be(true)
  end

  it "should return false if user is not an admin" do
    expect(user_2.admin?).to be(false)
  end

end
