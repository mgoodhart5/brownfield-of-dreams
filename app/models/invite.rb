class Invite
  attr_reader :handle, :email

  def initialize(handle, email)
    @handle = handle
    @email = email
  end

  def self.find_email(handle)
    information = GithubEmailService.new(handle)
    Invite.new(information.github_user[:login], information.github_user[:email])
  end

end
