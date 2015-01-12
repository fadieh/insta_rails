require 'rails_helper'

feature 'restaurants' do
	context 'no posts have been added' do
		scenario 'should display a prompt to add a post' do
			visit '/posts'
			expect(page).to have_content 'No posts'
			expect(page).to have_link 'Add a post'
		end
	end

	context 'posts have been added' do
		before do
			Post.create(name: 'Cats galore')
		end

		scenario 'display posts' do
			visit '/posts'
			expect(page).to have_content 'Cats galore'
			expect(page).not_to have_content 'No posts'
		end
	end


end