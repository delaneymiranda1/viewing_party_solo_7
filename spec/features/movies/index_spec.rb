require 'rails_helper'

RSpec.describe 'Movie Results Page', type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Joe', email: 'joe@gmail.com')
  end

  # US 2
  describe "when i visit `users/:user_id/movies`" do
    it 'I see 20 movie titles, their vote average, and a button to return to the discover page', :vcr do 
      visit user_movies_path(@user1)
  
      expect(page).to have_content('Title:', count: 20)

      expect(page).to have_content("Movie Title: The Shawshank Redemption")
      expect(page).to have_content("Average Rating: 8.711")
      expect(page).to have_content("Movie Title: The Godfather")
      expect(page).to have_content("Average Rating: 8.708")
      expect(page).to have_content("Movie Title: The Godfather Part II")
      expect(page).to have_content("Average Rating: 8.592")
      expect(page).to have_content("Movie Title: Schindler's List")
      expect(page).to have_content("Average Rating: 8.572")

      expect(page).to have_button("Back to Discover Page")
    end

    it 'each movie title is a link to the movies details page', :vcr do
      visit user_movies_path(@user1)
      click_link "The Godfather"
      
      expect(current_path).to eq("/users/#{@user1.id}/movies/238")

      visit user_movies_path(@user1)
      click_link "The Shawshank Redemption"
      expect(current_path).to eq("/users/#{@user1.id}/movies/278")

      visit user_movies_path(@user1)
      click_link "The Godfather Part II"
      expect(current_path).to eq("/users/#{@user1.id}/movies/240")
    end
  end
end
