require 'rails_helper'

RSpec.describe 'Movie Details Page', type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Joe', email: 'joe@gmail.com')
  end

  # US 3
  describe "When I visit a movie's detail page (`/users/:user_id/movies/:movie_id`)" do 
    it 'has buttons to create a viewing party and go back to the discover page,
      viewing party button redirects to new viewing party page', :vcr do
      visit "/users/#{@user1.id}/movies/238"

      expect(page).to have_button("Create a Viewing Party")
      expect(page).to have_button("Back to Discover Page")

      click_button("Create a Viewing Party")
      expect(current_path).to eq("/users/#{@user1.id}/movies/238/viewing_party/new")
    end

    it 'should have movie title, vote avg, runtime in hours/mins, genre, summary, 
      first 10 cast members and their characters, count of total reviews and each review and its author', :vcr do
      visit "/users/#{@user1.id}/movies/238"
      save_and_open_page
      expect(page).to have_content("Movie Title: The Godfather")
      expect(page).to have_content("Average Rating: 8.707")
      expect(page).to have_content("Runtime: 2h 55m")
      expect(page).to have_content("Genre: Drama, Crime")
      expect(page).to have_content("Summary: Spanning the years 1945 to 1955,")
      expect(page).to have_content("Cast:")
      expect(page).to have_content("Don Vito Corleone played by Marlon Brando")
      expect(page).to have_content('played by', count: 10)
      expect(page).to have_content("Total Reviews: 5")
      expect(page).to have_content("Author: futuretv")
      expect(page).to have_content("Review: The Godfather Review by Al Carlson")
      expect(page).to have_content("Author: crastana")
      expect(page).to have_content("Review: The best movie ever...")
      expect(page).to have_content("Author: drystyx")
      expect(page).to have_content("Review: While I'm writing this, The")
      expect(page).to have_content("Author: CinemaSerf")
      expect(page).to have_content("Review: When you get a story written quite this ")
      expect(page).to have_content("Author: Surya")
      expect(page).to have_content("Review: Great Movie **Ever**")
    end
  end

  xit '#sadpath - an invalid user id does not work' do

  end
end