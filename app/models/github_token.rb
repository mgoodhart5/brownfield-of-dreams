class GithubToken
  belongs_to :user

 #  def self.find_or_create_from_auth(auth)
 #   where(gh_user_id: auth['uid']).first_or_initialize.tap do |github_token|
 #     github_token.gh_user_id = auth['uid']
 #     github_token.user_id = User.current.id
 #     github_token.token = auth["credentials"]["token"]
 #     github_token.save!
 #   end
 # end
end
