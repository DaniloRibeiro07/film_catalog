class ChangeTypeReleasedToBolFromMovies < ActiveRecord::Migration[7.1]
  def change
    change_column :movies, :released, :boolean, default: false
  end
end
