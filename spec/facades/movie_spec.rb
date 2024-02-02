require 'rails_helper'

RSpec.describe MoviesFacade, type: :facade do
  describe 'movies facade' do
    before(:each) do
      @facade = MoviesFacade.new  
    end

    it 'exists' do
      expect(@facade).to be_a(MoviesFacade)
    end

    it '#top_rated_movies', :vcr do
      
      expect(@facade.top_rated_movies).to be_a(Array)
      @facade.top_rated_movies.each do |movie|
        expect(movie).to be_a(Movie)
        expect(movie).to respond_to(:id)
        expect(movie).to respond_to(:summary)
        expect(movie).to respond_to(:title)
        expect(movie).to respond_to(:vote_avg)
      end
    end
  end
end