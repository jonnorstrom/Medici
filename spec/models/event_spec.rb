require "rails_helper"
#
RSpec.describe Event, :type => :model do
  Event.create(name: "Art", blurb: "More Art", description: "Art stuff", address: "123 Fake St.", price: "10", photo: File.new("test/fixtures/field.jpg"), start_date: DateTime.now, end_date: DateTime.now, opening_time: DateTime.now, closing_time: DateTime.now, website: "www.aic.org")
  let(:field) {Event.new }

  it "is valid with valid attributes" do
    field.name = "Field Event"
    field.blurb = "A great event"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.photo = File.new("test/fixtures/field.jpg")
    field.start_date = DateTime.now
    field.end_date = DateTime.now
    field.opening_time = Time.now
    field.closing_time = Time.now
    field.website = "www.fieldevent.org"
    expect(field).to be_valid
  end
  it "is not valid without a name" do
    field.blurb = "A great event"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.photo = File.new("test/fixtures/field.jpg")
    field.start_date = DateTime.now
    field.end_date = DateTime.now
    field.opening_time = Time.now
    field.closing_time = Time.now
    field.website = "www.fieldevent.org"
    expect(field).to_not be_valid
  end
  it "is not valid without a blurb" do
    field.name = "Field Event"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.photo = File.new("test/fixtures/field.jpg")
    field.start_date = DateTime.now
    field.end_date = DateTime.now
    field.opening_time = Time.now
    field.closing_time = Time.now
    field.website = "www.fieldevent.org"
    expect(field).to_not be_valid
  end
  it "is not valid without a description" do
    field.name = "Field Event"
    field.blurb = "A great event"
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.photo = File.new("test/fixtures/field.jpg")
    field.start_date = DateTime.now
    field.end_date = DateTime.now
    field.opening_time = Time.now
    field.closing_time = Time.now
    field.website = "www.fieldevent.org"
    expect(field).to_not be_valid
  end
  it "is not valid without an address" do
    field.name = "Field Event"
    field.blurb = "A great event"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.price = 10
    field.photo = File.new("test/fixtures/field.jpg")
    field.start_date = DateTime.now
    field.end_date = DateTime.now
    field.opening_time = Time.now
    field.closing_time = Time.now
    field.website = "www.fieldevent.org"
    expect(field).to_not be_valid
  end
  it "is not valid without a price" do
    field.name = "Field Event"
    field.blurb = "A great event"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.photo = File.new("test/fixtures/field.jpg")
    field.start_date = DateTime.now
    field.end_date = DateTime.now
    field.opening_time = Time.now
    field.closing_time = Time.now
    field.website = "www.fieldevent.org"
    expect(field).to_not be_valid
  end
  it "is not valid without a photo" do
    field.name = "Field Event"
    field.blurb = "A great event"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.start_date = DateTime.now
    field.end_date = DateTime.now
    field.opening_time = Time.now
    field.closing_time = Time.now
    field.website = "www.fieldevent.org"
    expect(field).to_not be_valid
  end
  it "is not valid without a start date" do
    field.name = "Field Event"
    field.blurb = "A great event"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.photo = File.new("test/fixtures/field.jpg")
    field.end_date = DateTime.now
    field.opening_time = Time.now
    field.closing_time = Time.now
    field.website = "www.fieldevent.org"
    expect(field).to_not be_valid
  end
  it "is not valid without an end date" do
    field.name = "Field Event"
    field.blurb = "A great event"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.photo = File.new("test/fixtures/field.jpg")
    field.start_date = DateTime.now
    field.opening_time = Time.now
    field.closing_time = Time.now
    field.website = "www.fieldevent.org"
    expect(field).to_not be_valid
  end
  it "is not valid without valid an opening time" do
    field.name = "Field Event"
    field.blurb = "A great event"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.photo = File.new("test/fixtures/field.jpg")
    field.start_date = DateTime.now
    field.end_date = DateTime.now
    field.closing_time = Time.now
    field.website = "www.fieldevent.org"
    expect(field).to_not be_valid
  end
  it "is not valid without valid a closing time" do
    field.name = "Field Event"
    field.blurb = "A great event"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.photo = File.new("test/fixtures/field.jpg")
    field.start_date = DateTime.now
    field.end_date = DateTime.now
    field.opening_time = Time.now
    field.website = "www.fieldevent.org"
    expect(field).to_not be_valid
  end
  it "is not valid without valid website" do
    field.name = "Field Event"
    field.blurb = "A great event"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.photo = File.new("test/fixtures/field.jpg")
    field.start_date = DateTime.now
    field.end_date = DateTime.now
    field.opening_time = Time.now
    field.closing_time = Time.now
    expect(field).to_not be_valid
  end
  it "is not valid if opening time is after closing time" do
    field.name = "Field Event"
    field.blurb = "A great event"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.photo = File.new("test/fixtures/field.jpg")
    field.start_date = DateTime.now
    field.end_date = DateTime.now
    field.opening_time = DateTime.new(2002,1,1)
    field.closing_time = DateTime.new(2000,1,1)
    field.website = "www.fieldevent.org"
    expect(field).to_not be_valid
  end
  it "is not valid if start date is after end date" do
    field.name = "Field Event"
    field.blurb = "A great event"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.photo = File.new("test/fixtures/field.jpg")
    field.start_date = DateTime.new(2002,1,1)
    field.end_date = DateTime.new(2000,1,1)
    field.opening_time = DateTime.now
    field.closing_time = DateTime.now
    field.website = "www.fieldevent.org"
    expect(field).to_not be_valid
  end
  it "is not valid with same name" do
    field.name = "Art"
    field.blurb = "A great event"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.photo = File.new("test/fixtures/field.jpg")
    field.start_date = DateTime.now
    field.end_date = DateTime.now
    field.opening_time = Time.now
    field.closing_time = Time.now
    field.website = "www.fieldevent.org"
    expect(field).to_not be_valid
  end
  it "is not valid without correct photo dimensions" do
    field.name = "Field Event"
    field.blurb = "A great event"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.address = "1400 S Lake Shore Dr, Chicago, IL 60605"
    field.price = 10
    field.photo = File.new("test/fixtures/small_field.jpg")
    field.start_date = DateTime.now
    field.end_date = DateTime.now
    field.opening_time = Time.now
    field.closing_time = Time.now
    field.website = "www.fieldevent.org"
    field.save
    expect(field.errors[:photo]).to include("Height must be 400px")
  end
end
