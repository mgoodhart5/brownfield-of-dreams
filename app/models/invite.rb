class Invite
  attr_reader :handle

  def self.find_email(handle)
    email = GithubEmailService.new(handle)
  end

end
