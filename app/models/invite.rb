class Invite
  attr_reader :handle, :email, :user

  def initialize(handle, email)
    @handle = handle
    @email = email
  end

  def self.find_email(handle, current_user)
    information = GithubEmailService.new(handle, current_user)
    Invite.new(information.github_user[:login], information.github_user[:email])
  end

end
