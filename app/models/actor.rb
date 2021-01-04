class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def order_by_age
    self.order(:age)
  end

  def average_age
    self.average(:age)
  end

end
