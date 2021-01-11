require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'relationships' do
    it { should have_many :movie_actors}
    it { should have_many(:actors).through(:movie_actors) }
  end

  describe 'model testing' do
    it "can order actors from youngest to oldest" do
      studio_1 = Studio.create!(name: "Star Productions", location: "Milkyway")
      movie_1 = studio_1.movies.create!(title: "Louies Adventure", creation_year: "2008", genre: "Comedy")
      actor_1 = Actor.create!(name: "Denver Dean", age: 22)
      actor_2 = Actor.create!(name: "Maryloue", age: 20)
      actor_3 = Actor.create!(name: "Sal", age: 24)
      MovieActor.create!(actor_id: actor_1.id, movie_id: movie_1.id)
      MovieActor.create!(actor_id: actor_2.id, movie_id: movie_1.id)
      MovieActor.create!(actor_id: actor_3.id, movie_id: movie_1.id)

      actual = [actor_2, actor_1, actor_3]
      expect(Actor.youngest_to_oldest).to eq(actual)
    end

    it "can average actors age" do
      studio_1 = Studio.create!(name: "Star Productions", location: "Milkyway")
      movie_1 = studio_1.movies.create!(title: "Louies Adventure", creation_year: "2008", genre: "Comedy")
      actor_1 = Actor.create!(name: "Denver Dean", age: 22)
      actor_2 = Actor.create!(name: "Maryloue", age: 20)
      actor_3 = Actor.create!(name: "Sal", age: 24)
      MovieActor.create!(actor_id: actor_1.id, movie_id: movie_1.id)
      MovieActor.create!(actor_id: actor_2.id, movie_id: movie_1.id)
      MovieActor.create!(actor_id: actor_3.id, movie_id: movie_1.id)

      expect(Actor.average_age).to eq(22)
    end
  end
end
