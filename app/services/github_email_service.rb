class GithubService

  def initialize(handle)
    @handle = handle
  end

  def conn
    Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.params["handle"] = "#{@handle}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def email_info
    response = conn.get("/users")
    JSON.parse(response.body, symbolize_names: true)
  end

end
