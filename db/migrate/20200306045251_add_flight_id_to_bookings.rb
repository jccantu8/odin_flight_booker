class AddFlightIdToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :flight_id, :integer
    add_foreign_key :bookings, :flights, column: :flight_id
  end
end
