class CreateGithubTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :github_tokens do |t|
      t.integer :gh_user_id
      t.string :token
      t.references :user, foreign_key: true
    end
  end
end
