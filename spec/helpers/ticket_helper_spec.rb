require "rails_helper"

describe TicketHelper, type: :helper do
  let(:museum){Museum.create(name: "5th Element Museum", blurb: "Lilu", description: "Lots of elements", photo: File.new("test/fixtures/field.jpg"), price: 100, address: "1600 Outer Space Ave.", opening_time: Time.now, closing_time: Time.now, website: "www.5thelement.com")}
  # let(:ticket){museum.tickets.create(museum_id: museum.id, original_quantity: 2)}

  it "can count a total number of tickets for each post" do
    museum.tickets.new(original_quantity: 2)
    p museum.tickets
    p total_tickets(museum)
    expect(total_tickets(museum)).to eq(2)
  end

end
