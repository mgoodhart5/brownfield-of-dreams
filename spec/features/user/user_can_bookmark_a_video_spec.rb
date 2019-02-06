require 'rails_helper'

describe 'A registered user' do
  it 'can add videos to their bookmarks' do
    tutorial= create(:tutorial, title: "How to Tie Your Shoes")
    video = create(:video, title: "The Bunny Ears Technique", tutorial: tutorial)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit tutorial_path(tutorial)

    expect {
      click_on 'Bookmark'
    }.to change { UserVideo.count }.by(1)

    expect(page).to have_content("Bookmark added to your dashboard")
  end

  it "can't add the same bookmark more than once" do
    tutorial= create(:tutorial)
    video = create(:video, tutorial_id: tutorial.id)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit tutorial_path(tutorial)

    click_on 'Bookmark'
    expect(page).to have_content("Bookmark added to your dashboard")
    click_on 'Bookmark'
    expect(page).to have_content("Already in your bookmarks")
  end
end
describe  "a user checks a page for bookmarked videos" do
  it 'sees the bookmarked video on their profile', :vcr do
    tutorial = create(:tutorial)
    v_1 = create(:video, title: "So Fun", tutorial_id: tutorial.id)
    v_2 = create(:video, title: "So Not Fun", tutorial_id: tutorial.id)
    user_2 = create(:user)
    user_video_1 = UserVideo.create(user: user_2, video: v_1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_2)

    visit dashboard_path

    expect(page).to have_content("Bookmarked Segments")

    visit tutorial_path(tutorial)
    expect(page).to have_content(v_2.title)
    click_on(v_2.title)
    click_on 'Bookmark'
    expect(page).to have_content("Bookmark added to your dashboard")

    visit dashboard_path

    within ".bookmarks" do
      expect(page).to have_content(v_1.title)
      expect(page).to have_content(v_2.title)
    end
  end
end
