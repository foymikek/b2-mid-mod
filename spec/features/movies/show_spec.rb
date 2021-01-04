require 'rails_helper'

RSpec.describe "When I visit a movies show page" do
  it "I can see all the details about the movie" do
    studio_1 = Studio.create!(name: "Star Productions", location: "Milkyway")
    movie_1 = studio_1.movies.create!(title: "Louies Adventure", creation_year: "2008", genre: "Comedy")
    actor_1 = Actor.create!(name: "Denver Dean", age: 22)
    actor_2 = Actor.create!(name: "Maryloue", age: 19)
    actor_3 = Actor.create!(name: "Sal", age: 23)
    movie_actor_1 = MovieActor.create!(actor_id: actor_1.id, movie_id: movie_1.id)
    movie_actor_2 = MovieActor.create!(actor_id: actor_2.id, movie_id: movie_1.id)
    movie_actor_3 = MovieActor.create!(actor_id: actor_3.id, movie_id: movie_1.id)
    # Story 2 As a user, When I visit a movie's show page.
    visit "/movies/#{movie_1.id}"
    
    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_1.creation_year)
    expect(page).to have_content(movie_1.genre)
    # I see the movie's title, creation year, and genre,
    # and a list of all its actors from youngest to oldest.
    # And I see the average age of all of the movie's actors
  end
end
