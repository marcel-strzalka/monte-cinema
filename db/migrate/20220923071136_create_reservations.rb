class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :show, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
