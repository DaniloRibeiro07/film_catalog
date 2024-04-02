class ChangeTypeReleasedAndStatusToBoolFromMovie < ActiveRecord::Migration[7.1]
  def change
    change_column :movies, :released, :boolean, default: false
    change_column :movies, :status, :boolean, default: false
  end
end
