require 'rails_helper'

feature 'reviewing' do
	before {Post.create name: 'cats'}

	scenario 'allow users to leave a comment using a form' do
		visit '/posts'
		click_link 'Comment'
		fill_in 'Thoughts', with: 'So so'
		click_button 'Comment'
		save_and_open_page
		expect(current_path).to eq '/posts'
		expect(page).to have_content('So so')
	end

end