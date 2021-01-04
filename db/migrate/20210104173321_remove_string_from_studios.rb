class RemoveStringFromStudios < ActiveRecord::Migration[5.2]
  def change
    remove_column :studios, :string, :string
  end
end
