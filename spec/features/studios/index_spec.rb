require 'rails_helper'

RSpec.describe "When I visit studio index page" do
  it 'I can see all studios and their assocaited movie names listed' do
    studio_1 = Studio.create!(name: "Star Productions", location: "Milkyway")
    studio_2 = Studio.create!(name: "Moon Productions", location: "Eon 1")
    movie_1 = studio_1.movies.create!(title: "Louies Adventure", creation_year: "2008", genre: "Comedy")
    movie_2 = studio_1.movies.create!(title: "Bandit Takes Over", creation_year: "2008", genre: "Action")
    movie_3 = studio_2.movies.create!(title: "Scard Cat", creation_year: "2008", genre: "Thriller")
    movie_4 = studio_2.movies.create!(title: "Leahs Romance", creation_year: "2008", genre: "Romance")

    # Story 1 As a user, When I visit the studio index page
    visit "/studios"
    # I see a list of all of the movie studios And underneath each studio,
    within("#studio-name-#{studio_1.id}") do
      expect(page).to have_content(studio_1.name)
      expect(page).to have_content(movie_1.name)
      expect(page).to have_content(movie_2.name)
    end

    within("#studio-name-#{studio_2.id}") do
      expect(page).to have_content(studio_2.name)
      expect(page).to have_content(movie_3.name)
      expect(page).to have_content(movie_4.name)
    end
    # I see the names of all of its movies.
  end
end
