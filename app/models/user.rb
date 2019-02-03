class User < ApplicationRecord
  has_many :user_videos
  has_many :videos, through: :user_videos

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :first_name
  enum role: [:default, :admin]
  has_secure_password

  # def self.from_omniauth(auth)
  #   where(uid: auth.uid).first_or_initialize.tap do |user|
  #     user.uid = auth.uid
  #     user.token = auth.credentials.token
  #     user.save!
  #   end
  # end
end
