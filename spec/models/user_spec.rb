require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:password)}
  end

  describe 'roles' do
    it 'can be created as default user' do
      user = User.create(email: 'user@email.com', password: 'password', first_name:'Jim', role: 0)

      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end

    it 'can be created as an Admin user' do
      admin = User.create(email: 'admin@email.com', password: 'admin', first_name:'Bob', role: 1)

      expect(admin.role).to eq('admin')
      expect(admin.admin?).to be_truthy
    end
  end
  describe 'instance methods' do
    it '#bookmark_videos', :vcr do
      v_1, v_2, v_3 = create_list(:video, 3)
      user = create(:user)
      user_2 = create(:user)
      user_video_1 = UserVideo.create(user: user, video: v_1)
      user_video_2 = UserVideo.create(user: user, video: v_2)
      user_video_3 = UserVideo.create(user: user, video: v_3)
      user_video_4 = UserVideo.create(user: user_2, video: v_3)

      expect(user.bookmark_videos).to eq([v_1, v_2, v_3])
    end
  end
end
