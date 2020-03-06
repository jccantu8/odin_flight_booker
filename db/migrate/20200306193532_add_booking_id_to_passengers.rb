class AddBookingIdToPassengers < ActiveRecord::Migration[5.1]
  def change
    add_column :passengers, :booking_id, :integer
    add_foreign_key :passengers, :bookings, column: :booking_id
  end
end
