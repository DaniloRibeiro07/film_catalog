class ChangeTypeReleasedAndStatusToBinaryFromMovie < ActiveRecord::Migration[7.1]
  def change
    change_column :movies, :released, :binary, default: 0
    change_column :movies, :status, :binary, default: 0
  end
end
