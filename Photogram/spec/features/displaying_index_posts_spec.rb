require 'rails_helper'

feature 'Index displays a list of posts' do
  scenario 'the index displays correct created post information' do
    post_one = create(:post, caption: "This is post one")
    post_two = create(:post, caption: "This is the second post")

    visit '/'
    expect(page).to have_content("This is post one")
    expect(page).to have_content("This is the second post")
    expect(page).to have_css("img[src*='coffee']")
  end
end

feature 'Editing posts' do
  it "Updates a post caption" do
    post = create(:post, caption: 'Covefe')
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
    fill_in 'Caption', with: '#coffeetime'
    click_button 'Update Post'
    expect(page).to have_content("#coffeetime")
  end
end
