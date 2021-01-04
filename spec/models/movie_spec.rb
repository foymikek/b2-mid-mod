require 'rails_helper'

describe Movie, type: :model do
  describe 'relationships' do
    it { should have_many :movie_actors }
    it { should have_many(:actors).through(:movie_actors) }
  end
end
