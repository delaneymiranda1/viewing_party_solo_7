require 'rails_helper'

describe MoviesService do
  context "class methods" do
    context "#top_rated_movies" do
      xit "returns movie data" do
        search = MoviesService.new
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        movie_data = search[:results].first
        expect(movie_data).to have_key :id
        expect(movie_data[:id]).to be_a(String)
        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(String)
        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)
        expect(movie_data).to have_key :runtime
        expect(movie_data[:runtime]).to be_a(String)
        expect(movie_data).to have_key :genres
        expect(movie_data[:genres]).to be_a(String)
        expect(movie_data).to have_key :overview
        expect(movie_data[:overview]).to be_a(String)
        expect(movie_data).to have_key :name
        expect(movie_data[:name]).to be_a(String)
        expect(movie_data).to have_key :character
        expect(movie_data[:character]).to be_a(String)
        expect(movie_data).to have_key :total_results
        expect(movie_data[:total_results]).to be_a(String)
        expect(movie_data).to have_key :author
        expect(movie_data[:author]).to be_a(String)
        expect(movie_data).to have_key :content
        expect(movie_data[:content]).to be_a(String)

      end
    end
  end
end