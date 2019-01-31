class Following
  attr_reader :name, :url

  def initialize(attributes)
    # binding.pry
    @name = attributes[:login]
    @url = attributes[:html_url]
  end

  def self.find_all_followings(user)
    following_response = GithubService.new(user)
    following_response.followings_for_user.map do |following|
      Following.new(following)
    end
  end

end
