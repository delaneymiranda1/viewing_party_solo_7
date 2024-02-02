require "rails_helper"

RSpec.describe Movie do

  it "exists" do
    movie_details = {
      id: 238,
      vote_average: 8.708,
      original_title: "The Godfather",
      runtime: 175,
      genres: 'animation',
      overview: 'Who lives in a pineapple under the sea',
      name: 'Bob',
      character: 'The Builder',
      total_results: 5,
      author: 'joe',
      content: 'nice'
    }
    # @user1 = User.create!(name: 'Joe', email: 'joe@gmail.com')
    # @user2 = User.create!(name: 'Mama', email: 'mama@gmail.com')
    movie1 = Movie.new(movie_details)

    expect(movie1).to be_a Movie
    expect(movie1.id).to eq(238)
    expect(movie1.vote_avg).to eq(8.708)
    expect(movie1.title).to eq("The Godfather")
    expect(movie1.runtime).to eq(175)
    expect(movie1.genre).to eq('animation')
    expect(movie1.summary).to eq('Who lives in a pineapple under the sea')
    expect(movie1.cast_names).to eq('Bob')
    expect(movie1.cast_roles).to eq('The Builder')
    expect(movie1.review_count).to eq(5)
    expect(movie1.review_author).to eq('joe')
    expect(movie1.review_details).to eq('nice')
  end
end