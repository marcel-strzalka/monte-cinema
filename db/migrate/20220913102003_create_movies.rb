class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :length_in_minutes

      t.timestamps
    end
  end
end
