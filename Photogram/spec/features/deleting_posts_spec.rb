require 'rails_helper'

feature 'Deleting posts' do
  background do
    post = create(:post, caption: 'Covefe')
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'Can delete a single post' do
    click_link 'Delete Post'
    expect(page).to_not have_content('Covefe')
  end
end
