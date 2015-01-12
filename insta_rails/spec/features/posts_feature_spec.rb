require 'rails_helper'

feature 'restaurants' do
	context 'no posts have been added' do
		scenario 'should display a prompt to add a post' do
			visit '/posts'
			expect(page).to have_content 'No posts'
			expect(page).to have_link 'Add post'
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

	context 'creating posts' do
		scenario 'prompts user to fill out a form, then display the new post' do
			visit '/posts'
			click_link 'Add post'
			fill_in 'Name', with: 'Lush beans on toast'
			click_button 'Create Post'
			expect(page).to have_content 'Lush beans on toast'
			expect(current_path).to eq '/posts'
		end
	end

	context 'viewing posts' do
		let!(:cats){Post.create(name:'cats')}

		scenario 'lets a user view a post' do
			visit '/posts'
			click_link 'cats'
			expect(page).to have_content 'cats'
			expect(current_path).to eq "/posts/#{cats.id}"
		end
	end

end