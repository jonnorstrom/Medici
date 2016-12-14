require "rails_helper"

describe User do
  let(:user) {User.new}
  it "is valid with valid attributes" do
    user.full_name = "Corbin Dallas"
    user.password = "multipass"
    user.email = "corbin@dallas.com"
    expect(user).to be_valid
  end
  it "is not valid without an email" do
    user.full_name = "Corbin Dallas"
    user.password = "multipass"
    expect(user).to_not be_valid
  end
  it "is not valid without a password"do
      user.full_name = "Corbin Dallas"
      user.email = "corbin@dallas.com"
      expect(user).to_not be_valid
  end
  
  it "sends a welcome email" do
    user = User.create(full_name: "Corbin Dallas", email: "corbin@dallas.com", password: "multipass")
    expect {user.send_admin_mail }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end

describe UsersMailer do
  let(:user) {User.create(full_name: "Corbin Dallas", email: "corbin@dallas.com", password: "multipass")}
  let(:mail) {UsersMailer.signup_email(user)}

  it "renders the subject" do
    expect(mail.subject).to eql('Welcome to Medici Museums!')
  end

  it "renders the recipient email" do
    expect(mail.to).to eql([user.email])
  end

  it "renders the sender email" do
    expect(mail.from).to eql(['admin@medicimuseums.com'])
  end

  it "assigns @name" do
    expect(mail.body.encoded).to match(user.name)
  end


end
