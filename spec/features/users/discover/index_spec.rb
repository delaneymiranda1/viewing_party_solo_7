require 'rails_helper'

RSpec.describe 'User Discover Movies', type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Joe', email: 'joe@gmail.com')
  end

 # US 1
  describe 'When I visit the "/users/:id/discover" path', :vcr do
    it 'I see a Button to Discover Top Rated Movies,
      a text field to enter keyword(s) to search by movie title,
      and a Button to Search by Movie Title' do
      visit user_discover_index_path(@user1)
      expect(page).to have_button("Discover Top Rated Movies")
      expect(page).to have_content("Search by movie title:")
      expect(page).to have_field(:title)
      expect(page).to have_button("Search")
    end

    it 'when you click top rated movies button you are taken to the movie results page', :vcr do
      visit user_discover_index_path(@user1)

      click_button("Discover Top Rated Movies")
      expect(current_path).to eq(user_movies_path(@user1))
    end

    it 'when you click search button you are taken to the movie results page', :vcr do
      visit user_discover_index_path(@user1)

      click_button("Search")
      expect(current_path).to eq(user_movies_path(@user1))
    end

    xit '#sadpath - an invalid user id does not work' do

    end
  end
end


