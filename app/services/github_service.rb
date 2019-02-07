class GithubService

  def initialize(user)
    @user = user
  end

  def status
    response = conn.get("/user/repos")
    response.status
  end

  def repos_for_user
    response = conn.get("/user/repos")
    JSON.parse(response.body, symbolize_names: true).take(5)
  end

  def conn
    Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.params["access_token"] = "#{@user.token}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def followers_for_user
    response = conn.get("/user/followers")
    JSON.parse(response.body, symbolize_names: true)
  end

  def followings_for_user
    response = conn.get("/user/following")
    JSON.parse(response.body, symbolize_names: true)
  end

  def email_info(handle)
    response = conn.get("/users/#{handle}")
    JSON.parse(response.body, symbolize_names: true)
  end

end
