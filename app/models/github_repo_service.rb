class GithubRepoService

  def initialize(user)
    @user = user
  end

  def repos_for_user
    response = conn.get("/user/repos")
    JSON.parse(response.body, symbolize_names: true).take(5)
  end

  def conn
    the_token = ENV['GITHUB_API_KEY_MF']
    Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{the_token}"
      faraday.adapter Faraday.default_adapter
    end
  end
end
