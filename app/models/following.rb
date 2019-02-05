class Following
  attr_reader :name, :url, :in_system

  def initialize(attributes)
    @name = attributes[:login]
    @url = attributes[:html_url]
    @in_system = false
  end

  def self.find_all_followings(user)
    following_response = GithubService.new(user)
    following_response.followings_for_user.map do |following|
      Following.new(following)
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
