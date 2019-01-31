require 'rails_helper'

describe GithubFollowerService do
  it 'exists' do
    user = create(:user)
    gfs = GithubFollowerService.new(user)

    expect(gfs).to be_a(GithubFollowerService)
  end

  it 'Gets followers for user' do
    VCR.use_cassette("gets_followers_for_users") do
      user = create(:user)
      gfs = GithubFollowerService.new(user)

      expect(gfs.followers_for_user.count).to eq(24)
      expect(gfs.followers_for_user.first).to have_key(:handle)
      expect(gfs.followers_for_user.first).to have_key(:html_url)
    end
  end

end
