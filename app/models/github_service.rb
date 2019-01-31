class GithubService

  def initialize(user)
    @user = user
  end

  def repos_for_user
    response = conn.get("/user/repos")
    JSON.parse(response.body, symbolize_names: true).take(5)
  end

  def conn
    the_token = ENV['GITHUB_API_KEY']
    Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{the_token}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def followers_for_user
    response = conn.get("/user/followers")
    JSON.parse(response.body, symbolize_names: true)
  end

  def followings_for_user
    response = conn.get("/user/following")
    # binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end

end
