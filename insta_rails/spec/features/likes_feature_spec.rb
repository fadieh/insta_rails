require 'rails_helper'

feature 'liking posts' do

	before do
		lol = Post.create(name: 'lol')
		lol.comments.create(thoughts: 'lmao')
	end

	it "a user can like a post, which increments the like count", js: true do
		visit '/posts'
		click_link 'Like'
		save_and_open_page
		expect(page).to have_content("1 like")
	end

end