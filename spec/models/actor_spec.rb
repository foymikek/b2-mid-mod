require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'relationships' do
    it { should have_many :movie_actors }
    it { should have_many(:movies).through(:movie_actors) }
  end

  describe 'model methods' do
    it "can sort actors by age, youngest to oldest" do
      studio_1 = Studio.create!(name: "Star Productions", location: "Milkyway")
      movie_1 = studio_1.movies.create!(title: "Louies Adventure", creation_year: "2008", genre: "Comedy")
      actor_1 = Actor.create!(name: "Denver Dean", age: 22)
      actor_2 = Actor.create!(name: "Maryloue", age: 19)
      actor_3 = Actor.create!(name: "Sal", age: 23)
      movie_actor_1 = MovieActor.create!(actor_id: actor_1.id, movie_id: movie_1.id)
      movie_actor_2 = MovieActor.create!(actor_id: actor_2.id, movie_id: movie_1.id)
      movie_actor_3 = MovieActor.create!(actor_id: actor_3.id, movie_id: movie_1.id)


      expect(movie_1.actors.order_by_age).to eq([actor_2, actor_1, actor_3])
    end

    it "can calculate the average age of the actors" do
      studio_1 = Studio.create!(name: "Star Productions", location: "Milkyway")
      movie_1 = studio_1.movies.create!(title: "Louies Adventure", creation_year: "2008", genre: "Comedy")
      actor_1 = Actor.create!(name: "Denver Dean", age: 22)
      actor_2 = Actor.create!(name: "Maryloue", age: 20)
      actor_3 = Actor.create!(name: "Sal", age: 24)
      movie_actor_1 = MovieActor.create!(actor_id: actor_1.id, movie_id: movie_1.id)
      movie_actor_2 = MovieActor.create!(actor_id: actor_2.id, movie_id: movie_1.id)
      movie_actor_3 = MovieActor.create!(actor_id: actor_3.id, movie_id: movie_1.id)

      expect(movie_1.actors.average_age). to eq(22)
    end
  end
end
