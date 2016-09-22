require 'test_helper'
require "rspec"

describe "User Create" do

  let(:browser) { @browser ||= Watir::Browser.new :chrome }
  before { browser.goto "http://localhost:3000" }
  after { browser.close }

  it "should register and create a project" do
    browser.goto "http://localhost:3000/users/sign_up"
    browser.text_field(:name => "user[email]").set "mkonda-test@jemurai.com"
    browser.text_field(:name => "user[password]").set "password"
    browser.text_field(:name => "user[password_confirmation]").set "password"
    browser.button(:name => "commit").click

    uri = URI("http://localhost:3000")
    res = Net::HTTP.get_response(uri)
    headers = res.header.to_hash
    puts headers

  end

end
