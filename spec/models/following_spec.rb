require 'rails_helper'

describe Following do
  it 'exists', :vcr do
    attributes = {}
    following = Following.new(attributes)

    expect(following).to be_a(Following)
  end

  it 'is initialized with attributes', :vcr do
    name = "Lee"
    url = "www.example.com"
    attributes = {login: name, html_url: url}
    following = Following.new(attributes)

    expect(following.name).to eq(name)
    expect(following.url).to eq(url)
  end
end

describe '.class methods' do
  it '.find_all_followings', :vcr do
    user = create(:token_user)
    
    expect(Following.find_all_followings(user).count).to eq(30)
  end
end
