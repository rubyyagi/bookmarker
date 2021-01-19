require 'rails_helper'

RSpec.describe 'update bookmark', type: :system do
  # this will create a 'bookmark' method, before each scenario is ran
  let!(:bookmark) { Bookmark.create(url: 'https://rubyyagi.com', title: 'Ruby Yagi') }
  let!(:bookmark_two) { Bookmark.create(url: 'https://fluffy.es', title: 'Fluffy.es') }

  scenario 'visit index' do
    visit bookmarks_path
  
    # The page should list the bookmarks
    expect(page).to have_content(bookmark.url)
    expect(page).to have_content(bookmark.title)

    expect(page).to have_content(bookmark_two.url)
    expect(page).to have_content(bookmark_two.title)
  end
end
