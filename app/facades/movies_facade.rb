class MoviesFacade

  def top_rated_movies 
    service = MoviesService.new
    json = service.get_top_rated_movies
    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def movie_details(id)
    service = MoviesService.new
    json = service.get_movie_details(id)
    @movie_deets = Movie.new(json)
  end

  def movie_cast(id)
    service = MoviesService.new
    json = service.get_movie_cast(id)
    @movie_cast = json[:cast]
  end

  def movie_reviews(id)
    service = MoviesService.new
    json = service.get_movie_reviews(id)
    @movie_reviews = json
  end
end