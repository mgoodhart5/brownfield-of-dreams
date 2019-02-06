require 'rails_helper'

RSpec.describe Tutorial, type: :model do
  describe 'instance methods' do
    it '.non_classroom_tutorials' do
      tutorial = create(:tutorial)
      tutorial_2 = create(:tutorial, classroom: true)
      tutorial_3 = create(:tutorial)

      expect(Tutorial.non_classroom_tutorials).to eq([tutorial, tutorial_3])
    end
  end
end
