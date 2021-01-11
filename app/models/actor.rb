class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def self.youngest_to_oldest
    order(:age)
  end

  def self.average_age
    average(:age)
  end

  def self.search_by_name(name_arg)
    find_by(name: name_arg)
  end
end
