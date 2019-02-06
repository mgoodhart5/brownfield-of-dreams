class User < ApplicationRecord
  has_many :user_videos
  has_many :videos, through: :user_videos
  has_many :friendees, foreign_key: :friendee_id, class_name: 'Friendship'
  has_many :friends, through: :friendees

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, on: :create
  validates_presence_of :first_name
  enum role: [:default, :admin]
  has_secure_password

  def token_valid?
    GithubService.new(self).status == 200
  end

  def bookmark_videos
    Video.joins(:user_videos)
      .where("videos.id = user_videos.video_id")
      .where("user_videos.user_id = ?", self.id)
      .order(:position)
      .order(:tutorial_id)
  end
end
