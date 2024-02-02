class ViewingPartiesController < ApplicationController
  
  def new
    @all_users = User.all
    @host = User.find(params[:user_id])
    movie_facade = MoviesFacade.new
    @movie = movie_facade.movie_details(params[:id])
  end

  def create 
    @host = User.find(params[:user_id]) 
    movie_facade = MoviesFacade.new
    @movie = movie_facade.movie_details(params[:id])

    if success
      party = ViewingParty.create!(user: @host, host: true)
      User.all.each do |user|
        if user != @host && params[user.name.to_s] == '1'
          ViewingParty.create!(user: user, party: party, host: false)
        end
      end
      redirect_to user_path(@host)
    else
      redirect_to "/users/#{@host.id}/movies/#{@movie.id}/viewing_parties/new"
      flash[:alert] = 'invalid duration'
    end

  end
end