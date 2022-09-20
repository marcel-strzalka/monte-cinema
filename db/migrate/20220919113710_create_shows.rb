class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.references :hall, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.datetime :start_time, null: false

      t.timestamps
    end
  end
end
