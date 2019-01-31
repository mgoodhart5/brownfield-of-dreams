require 'rails_helper'

describe Follower do
  it 'exists', :vcr do
    attributes = {}
    follower = Follower.new(attributes)

    expect(follower).to be_a(Follower)
  end

  it 'is initialized with attributes', :vcr do
    name = "Lee"
    url = "www.example.com"
    attributes = {login: name, html_url: url}
    follower = Follower.new(attributes)

    expect(follower.name).to eq(name)
    expect(follower.url).to eq(url)
  end
end
