class MoviesController < ApplicationController

  def index
    @movies_facade = MoviesFacade.new
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @movie_facade = MoviesFacade.new
    @movie = @movie_facade.movie_details(params[:id])
    @movie_cast = @movie_facade.movie_cast(params[:id])
    @movie_reviews = @movie_facade.movie_reviews(params[:id])
  end
end