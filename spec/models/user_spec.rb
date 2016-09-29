require "rails_helper"

RSpec.describe User, :type => :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.name = "Corbin Dallas"
    subject.password = "multipass"
    subject.email = "corbin@dallas.com"
    expect(subject).to be_valid
  end
  it "is not valid without an email" do
    subject.name = "Corbin Dallas"
    subject.password = "multipass"
    expect(subject).to_not be_valid
  end
  it "is not valid without a password"do
      subject.name = "Corbin Dallas"
      subject.email = "corbin@dallas.com"
      expect(subject).to_not be_valid
  end
  it "is not valid without a name" do
    subject.password = "multipass"
    subject.email = "corbin@dallas.com"
    expect(subject).to_not be_valid
  end
end
