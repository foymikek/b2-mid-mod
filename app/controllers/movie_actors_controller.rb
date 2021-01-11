class MovieActorsController < ApplicationController
  def create
    # require "pry"; binding.pry
    actor = Actor.search_by_name(params[:name])
    new_actor = MovieActor.create!(
      actor_id: actor.id,
      movie_id: params[:movie_id]
    )
    new_actor.save
    redirect_to movie_path(params[:movie_id])
  end
end
