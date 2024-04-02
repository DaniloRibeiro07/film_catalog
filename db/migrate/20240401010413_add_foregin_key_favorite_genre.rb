class AddForeginKeyFavoriteGenre < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :directors, :genres, column: :favorite_genre_id
  end
end
