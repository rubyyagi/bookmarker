require 'rails_helper'

RSpec.describe 'create bookmark', type: :system do
  scenario 'empty title and url' do
    visit new_bookmark_path
    click_button 'Create Bookmark'

    # The page should show error message 'Title can't be blank'
    expect(page).to have_content("Title can't be blank")

    # No bookmark record is created
    expect(Bookmark.count).to eq(0)
  end
  
  # happy path scenario block
  scenario 'valid title and url' do
    visit new_bookmark_path
    # fill in text fields with specified string
    fill_in 'Title', with: 'RubyYagi'
    fill_in 'Url', with: 'https://rubyyagi.com'
    click_button 'Create Bookmark'
    
    # The page should show success message
    expect(page).to have_content("Bookmark was successfully created")

    # 1 new bookmark record is created
    expect(Bookmark.count).to eq(1)
    
    # Optionally, you can check the latest record data
    expect(Bookmark.last.title).to eq('RubyYagi')
  end
end
