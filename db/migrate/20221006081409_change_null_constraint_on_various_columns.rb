class ChangeNullConstraintOnVariousColumns < ActiveRecord::Migration[7.0]
  def change
    # Halls
    change_column_null(:halls, :name, false)
    change_column_null(:halls, :capacity, false)

    # Movies
    change_column_null(:movies, :title, false)
    change_column_null(:movies, :length_in_minutes, false)

    # Reservations
    change_column_null(:reservations, :status, false)

    # Tickets
    change_column_null(:tickets, :seat_number, false)

    # Users
    change_column_null(:users, :role, false)
  end
end
