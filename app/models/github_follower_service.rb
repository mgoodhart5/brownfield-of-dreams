class GithubFollowerService

  def initialize(user)
    @user = user
  end

  def followers_for_user
    response = conn.get("/user/followers")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    the_token = ENV['GITHUB_API_KEY']
    Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{the_token}"
      faraday.adapter Faraday.default_adapter
    end
  end

end
