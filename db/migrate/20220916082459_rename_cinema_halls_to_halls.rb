class RenameCinemaHallsToHalls < ActiveRecord::Migration[7.0]
  def change
    rename_table :cinema_halls, :halls
  end
end
