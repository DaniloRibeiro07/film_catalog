class RemoveFavoriteGenreId < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :directors, column: :favorite_genre_id
  end
end
