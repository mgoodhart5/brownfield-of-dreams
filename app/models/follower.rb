class Follower
  attr_reader :name, :url

  def initialize(attributes)
    @name = attributes[:login]
    @url = attributes[:html_url]
  end

  def self.find_all_followers(user)
    github_follower_response = GithubService.new(user)
    github_follower_response.followers_for_user.map do |follower|
      Follower.new(follower)
    end
  end
end
