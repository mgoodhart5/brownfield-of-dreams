require 'rails_helper'

describe GithubRepoService do
  it "exists" do
    VCR.use_cassette("gets_repos_for_user") do
      user = create(:user)
      grp = GithubRepoService.new(user)

      expect(grp).to be_a(GithubRepoService)
    end
  end
  it "gets repos for user" do
    VCR.use_cassette("gets_repos_for_user") do

      user = create(:user)
      grp = GithubRepoService.new(user)

      expect(grp.repos_for_user.count).to eq(5)
      expect(grp.repos_for_user.first).to have_key(:name)
      expect(grp.repos_for_user.first).to have_key(:html_url)
    end
  end
end
