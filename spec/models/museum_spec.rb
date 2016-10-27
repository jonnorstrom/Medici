require "rails_helper"
#
RSpec.describe Museum, :type => :model do
  let(:field) {Museum.new }

  it "is valid with valid attributes" do
    field.name = "Field Museum"
    field.blurb = "A great museum"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.photo = File.new("test/fixtures/field.jpg")
    field.opening_time = Time.now
    field.closing_time = Time.now
    field.website = "www.fieldmuseum.org"
    expect(field).to be_valid
  end
  it "is not valid without a name" do
    field.blurb = "A great museum"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.photo = File.new("test/fixtures/field.jpg")
    field.opening_time = Time.now
    field.closing_time = Time.now
    field.website = "www.fieldmuseum.org"
    expect(field).to_not be_valid
  end
  it "is not valid without a blurb" do
    field.name = "Field Museum"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.photo = File.new("test/fixtures/field.jpg")
    field.opening_time = Time.now
    field.closing_time = Time.now
    field.website = "www.fieldmuseum.org"
    expect(field).to_not be_valid
  end
  it "is not valid without a description" do
    field.name = "Field Museum"
    field.blurb = "A great museum"
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.photo = File.new("test/fixtures/field.jpg")
    field.opening_time = Time.now
    field.closing_time = Time.now
    field.website = "www.fieldmuseum.org"
    expect(field).to_not be_valid
  end
  it "is not valid without an address" do
    field.name = "Field Museum"
    field.blurb = "A great museum"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.price = 10
    field.photo = File.new("test/fixtures/field.jpg")
    field.opening_time = Time.now
    field.closing_time = Time.now
    field.website = "www.fieldmuseum.org"
    expect(field).to_not be_valid
  end
  it "is not valid without a price" do
    field.name = "Field Museum"
    field.blurb = "A great museum"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.photo = File.new("test/fixtures/field.jpg")
    field.opening_time = Time.now
    field.closing_time = Time.now
    field.website = "www.fieldmuseum.org"
    expect(field).to_not be_valid
  end
  it "is not valid without a photo" do
    field.name = "Field Museum"
    field.blurb = "A great museum"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.opening_time = Time.now
    field.closing_time = Time.now
    field.website = "www.fieldmuseum.org"
    expect(field).to_not be_valid
  end
  it "is not valid without valid an opening time" do
    field.name = "Field Museum"
    field.blurb = "A great museum"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.photo = File.new("test/fixtures/field.jpg")
    field.closing_time = Time.now
    field.website = "www.fieldmuseum.org"
    expect(field).to_not be_valid
  end
  it "is not valid without valid a closing time" do
    field.name = "Field Museum"
    field.blurb = "A great museum"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.photo = File.new("test/fixtures/field.jpg")
    field.opening_time = Time.now
    field.website = "www.fieldmuseum.org"
    expect(field).to_not be_valid
  end
  it "is not valid without valid website" do
    field.name = "Field Museum"
    field.blurb = "A great museum"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.photo = File.new("test/fixtures/field.jpg")
    field.opening_time = Time.now
    field.closing_time = Time.now
    expect(field).to_not be_valid
  end
  it "is not valid if opening time is after closing time" do
    field.name = "Field Museum"
    field.blurb = "A great museum"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.photo = File.new("test/fixtures/field.jpg")
    field.opening_time = DateTime.new(2002,1,1)
    field.closing_time = DateTime.new(2000,1,1)
    field.website = "www.fieldmuseum.org"
    expect(field).to_not be_valid
  end
  it "is not valid without the correct photo dimensions" do
    field.name = "Field Museum"
    field.blurb = "A great museum"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.photo = File.new("test/fixtures/small_field.jpg")
    field.opening_time = Time.now
    field.closing_time = Time.now
    field.website = "www.fieldmuseum.org"
    expect(field).to_not be_valid
  end
end
