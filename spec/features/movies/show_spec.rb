require 'rails_helper'

RSpec.describe "When I visit a movies show page" do
  it "I can see all the details about the movie" do
    studio_1 = Studio.create!(name: "Star Productions", location: "Milkyway")
    movie_1 = studio_1.movies.create!(title: "Louies Adventure", creation_year: "2008", genre: "Comedy")
    actor_1 = Actor.create!(name: "Denver Dean", age: 22)
    actor_2 = Actor.create!(name: "Maryloue", age: 20)
    actor_3 = Actor.create!(name: "Sal", age: 24)
    MovieActor.create!(actor_id: actor_1.id, movie_id: movie_1.id)
    MovieActor.create!(actor_id: actor_2.id, movie_id: movie_1.id)
    MovieActor.create!(actor_id: actor_3.id, movie_id: movie_1.id)

    visit movie_path(movie_1.id)

    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_1.creation_year)
    expect(page).to have_content(movie_1.genre)
    expect(actor_2.name).to appear_before(actor_1.name)
    expect(actor_1.name).to appear_before(actor_3.name)
    expect(page).to have_content("Average actors age: 22")
  end
end
