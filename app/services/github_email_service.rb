class GithubEmailService

  def initialize(handle)
    @handle = handle
  end

  def conn
    Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def github_user
    response = conn.get("/users/#{@handle}")
    JSON.parse(response.body, symbolize_names: true)
  end

end
