class ChangeDatatimeToDataFromDirectors < ActiveRecord::Migration[7.1]
  def change
    change_column :directors, :birthday, :date
  end
end
