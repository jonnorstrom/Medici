require "rails_helper"

describe Order do
  let(:order_1){Order.create}
  let(:museum){Museum.create(name: "5th Element Museum", blurb: "Lilu", description: "Lots of elements", photo: File.new("test/fixtures/field.jpg"), price: 100, address: "1600 Outer Space Ave.", opening_time: Time.now, closing_time: Time.now, website: "www.5thelement.com")}
  let(:current_order){order_1}
  let(:ticket_1){order_1.tickets.new(quantity: 1, museum_id: museum.id)}
  let(:ticket_2){order_1.tickets.new(quantity: 1, museum_id: museum.id)}

  it "has tickets that belongs to the order" do


    order_1.save
    expect(ticket_1.order).to eq(order_1)
  end

  it "can calculate a subtotal" do
    ticket_1
    ticket_2
    order_1.save
    expect(current_order.subtotal).to eq(200.0)
  end

end
