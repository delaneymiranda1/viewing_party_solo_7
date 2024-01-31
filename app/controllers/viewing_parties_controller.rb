class ViewingPartiesController < ApplicationController
  
  def new
    @all_users = User.all
    @host = User.find(params[:user_id])
    movies_search = MoviesSearchService.new
    @movie = movies_search.genre_runtime(params[:id])
    @host = User.find(params[:user_id])

    
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    end
    response = conn.get("/3/movie/#{params[:movie_id]}")
    json = JSON.parse(response.body, symbolize_names: true)
    
    @movie = json
  end

  def create 
    @host = User.find(params[:user_id]) 
    # conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
    #   faraday.params["api_key"] = Rails.application.credentials.tmdb[:key]
    # end
    # response = conn.get("/3/movie/#{params[:movie_id]}")
    # json = JSON.parse(response.body, symbolize_names: true)
    
    # @movie = json

    # if success
    #   user_party = ViewingParty.create!(user: host, party: party, host: true)
    #   User.all.each do |user|
    #     if user != host && params[user.name.to_s] == '1'
    #       UserParty.create!(user: user, party: party, host: false)
    #     end
    #   end
    #   redirect_to user_path(host)
    # else
    #   redirect_to "/users/#{host.id}/movies/#{movie.movie_id}/parties/new"
    #   flash[:alert] = 'invalid duration'
    # end

  end
end