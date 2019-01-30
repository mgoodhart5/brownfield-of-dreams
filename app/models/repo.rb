class Repo
  attr_reader :name, :url

  def initialize(attributes)
    @name = attributes[:name]
    @url = attributes[:html_url]
  end

  def self.find_all(user)
    github_repos = GithubRepoService.new(user)
    github_repos.repos_for_user.map do |repo|
      Repo.new(repo)
    end
  end

end
