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
    amount = Follower.find_all_followers(user).count

    expect(Follower.find_all_followers(user).count).to eq(amount)
  end
end

describe '#instance methods' do
  it '#app_user?' do
    create(:user, github_id: "nick0lass")
    name = "nick0lass"
    email = "email@gmail.com"
    attributes = {login: name, gh_email: email}
    follower = Follower.new(attributes)

    expect(follower.app_user?).to eq(true)
  end
end
