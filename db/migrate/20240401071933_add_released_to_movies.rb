class AddReleasedToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :released, :integer, default: 0
  end
end
