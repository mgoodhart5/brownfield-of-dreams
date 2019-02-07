require 'rails_helper'

describe Video do
  it 'exists' do
    video = Video.new

    expect(video).to be_a(Video)
  end
  describe 'validations' do
    it {should validate_presence_of(:position)}
  end
end
