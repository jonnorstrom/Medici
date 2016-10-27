require 'rails_helper'

describe Ticket do
    let(:museum){Museum.create(name: "5th Element Museum", blurb: "Lilu", description: "Lots of elements", photo: File.new("test/fixtures/field.jpg"), price: 100, address: "1600 Outer Space Ave.", opening_time: Time.now, closing_time: Time.now, website: "www.5thelement.com")}
    let(:ticket){Ticket.new(museum_id: museum.id)}

    it "is valid with quantity" do
      ticket.quantity = 1
      expect(ticket).to be_valid
    end

    it "is invalid with negative quantity" do
      ticket.quantity = -1
      expect(ticket).to_not be_valid
    end

    it "is invalid without quantity" do
      expect(ticket).to_not be_valid
    end

    it "calculates a unit price" do
      expect(ticket.unit_price).to eql(museum.price)
    end

    it "calculates a total price" do
      ticket.quantity = 2
      expect(ticket.total_price).to eql(200.0)
    end
end
