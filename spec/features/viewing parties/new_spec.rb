require 'rails_helper'

RSpec.describe 'New Viewing Party Page', type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Joe', email: 'joe@gmail.com')
    @user2 = User.create!(name: 'Bob', email: 'bob@gmail.com')
    @user3 = User.create!(name: 'Sam', email: 'sam@gmail.com')
  end

  # it 'visit user' do
  #   visit user_path(@user1)
  #   save_and_open_page
  # end

  describe "when i visit '/users/:user_id/movies/:movie_id/viewing_party/new'" do
    xit 'i should see the movie title with a form to fill out', :vcr do
      visit "/users/#{@user1.id}/movies/238/viewing_parties/new"
      save_and_open_page
      expect(page).to have_content('The Godfather')

      fill_in :duration, with: 180
      fill_in :date, with: (Date.today + 1)
      fill_in :start_time, with: '6:00'

      # expect(page).to have_unchecked_field "#{@user2.name}"
      # expect(page).to have_unchecked_field "#{@user3.name}"
      # check_field "#{@user3.name}"
      expect(page).to have_button('Create')
      click_button 'Create'
      expect(current_path).to eq(user_path(@user1))
    end
  end
end