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

describe '.class methods' do
  it '.find_all_followers', :vcr do
    user = create(:token_user)

    expect(Follower.find_all_followers(user).count).to eq(24)
  end
end
