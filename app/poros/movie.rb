class Movie

  attr_reader :vote_avg,
              :title,
              :summary,
              :movie_id,
              :genre,
              :runtime,
              :cast_names,
              :cast_roles,
              :review_author,
              :review_details,
              :review_count
              :movie_image


  def initialize(details)
    @movie_id = details[:id]
    @vote_avg = details[:vote_average]
    @title = details[:original_title]
    @runtime = details[:runtime]
    @genre = details[:genres]
    @summary = details[:overview]
    @cast_names = details[:name]
    @cast_roles = details[:character]
    @review_count = details[:total_results] 
    @review_author = details[:author] 
    @review_details = details[:content]
    @movie_image = details[:poster_path]
  end

end