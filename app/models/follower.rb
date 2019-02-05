class Follower
  attr_reader :name, :url, :in_system

  def initialize(attributes)
    @name = attributes[:login]
    @url = attributes[:html_url]
    @in_system = false
  end

  def self.find_all_followers(user)
    github_follower_response = GithubService.new(user)
    github_follower_response.followers_for_user.map do |follower|
      Follower.new(follower)
    end
  end

  def app_user?
    github_names = User.where.not(github_id: nil).pluck(:github_id)
    if github_names.include?(self.name)
      @in_system = true
    end
    @in_system
  end
end
