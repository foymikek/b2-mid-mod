class AddStudioIdToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :studio_id, :integer
  end
end
