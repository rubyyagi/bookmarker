require 'rails_helper'

RSpec.describe 'delete bookmark', type: :system do
  # this will create a 'bookmark' method, before each scenario is ran
  let!(:bookmark) { Bookmark.create(url: 'https://rubyyagi.com', title: 'Ruby Yagi') }

  scenario 'deletion' do
    visit bookmarks_path
  
    # click the link that has the text 'Destroy'
    # and click 'OK' in the confirmation alert
    accept_confirm do
      click_link 'Destroy'
    end

    # The page should show success message
    expect(page).to have_content("Bookmark was successfully destroyed.")

    # The bookmark data should not be shown
    expect(page).to_not have_content(bookmark.url)
    expect(page).to_not have_content(bookmark.title)

    expect(Bookmark.count).to eq(0)
  end
end
