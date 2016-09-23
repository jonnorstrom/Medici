require "rails_helper"
#
RSpec.describe Museum, :type => :model do
  let(:field) {Museum.new }

  it "is valid with valid attributes" do
    field.name = "Field Museum"
    subject.password = "multipass"
    subject.email = "corbin@dallas.com"
    expect(subject).to be_valid
  end
end
# require_relative "../orange"
# require_relative "../orange_tree"
#

# describe Museum do
#   let(:field) { Museum.new }
#
#   #You'll need to switch `pending` to `describe` when you're ready
#   # to implement each set of tests.
#
#   describe "#pass_growing_season" do
#     it "should change the age" do
#       expect {tree.pass_growing_season}.to change {tree.age}
#     end
#
#     it "should make the tree grow" do
#       #This should be more explicit. How much should the tree grow?
#       expect {tree.pass_growing_season}.to change{tree.height}
#     end
#   end

end
