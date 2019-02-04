require 'rails_helper'

describe GithubService do
  it 'exists' do
    VCR.use_cassette("gets_repo_for_users") do
      user = create(:user)
      grp = GithubService.new(user)

      expect(grp).to be_a(GithubService)
    end
  end

  it 'gets repos for user' do
    VCR.use_cassette("gets_repo_for_users") do
      user = create(:token_user)
      grp = GithubService.new(user)

      expect(grp.repos_for_user.count).to eq(5)
      expect(grp.repos_for_user.first).to have_key(:name)
      expect(grp.repos_for_user.first).to have_key(:html_url)
    end
  end

end
