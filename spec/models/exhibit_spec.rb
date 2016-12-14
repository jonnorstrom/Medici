require "rails_helper"

describe Exhibit do
  let(:field) {Exhibit.new }
  let(:museum){Museum.create(name: "5th Element Museum", blurb: "Lilu", description: "Lots of elements", photo: File.new("test/fixtures/field.jpg"), price: 100, address: "1600 Outer Space Ave.", opening_time: Time.now, closing_time: Time.now, website: "www.5thelement.com")}
  it "is valid with valid attributes" do
    field.name = "Field Exhibit"
    field.blurb = "A great exhibit"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.photo = File.new("test/fixtures/field.jpg")
    field.museum_id = museum.id
    expect(field).to be_valid
  end
  it "is not valid without a museum" do
    field.name = "Field Exhibit"
    field.blurb = "A great exhibit"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.photo = File.new("test/fixtures/field.jpg")
  end
  it "is not valid without a name" do
    field.blurb = "A great exhibit"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.photo = File.new("test/fixtures/field.jpg")
    field.museum_id = museum.id
    expect(field).to_not be_valid
  end
  it "is not valid without a blurb" do
    field.name = "Field Exhibit"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.photo = File.new("test/fixtures/field.jpg")
    field.museum_id = museum.id
    expect(field).to_not be_valid
  end
  it "is not valid without a description" do
    field.name = "Field Exhibit"
    field.blurb = "A great exhibit"
    field.photo = File.new("test/fixtures/field.jpg")
    field.museum_id = museum.id
    expect(field).to_not be_valid
  end
  it "is not valid without a photo" do
    field.name = "Field Exhibit"
    field.blurb = "A great exhibit"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.museum_id = museum.id
    expect(field).to_not be_valid
  end
  it "is not valid without the correct photo dimensions" do
    field.name = "Field Exhibit"
    field.blurb = "A great exhibit"
    field.description = "Remember when SUE was a huge deal? It's still great."
    field.photo = File.new("test/fixtures/small_field.jpg")
    field.save
    expect(field.errors[:photo]).to include("Height must be 298px")
  end
end
