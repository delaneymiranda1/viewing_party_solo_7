class MoviesService 
  def conn 
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end
  end
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_top_rated_movies
    get_url("/3/movie/top_rated")
  end

  def get_movie_details(id)
    get_url("/3/movie/#{id}")
  end

  def get_movie_cast(id)
    get_url("/3/movie/#{id}/credits")
  end

  def get_movie_reviews(id)
    get_url("/3/movie/#{id}/reviews")
  end
end