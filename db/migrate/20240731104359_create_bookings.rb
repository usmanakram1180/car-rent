class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :car_type
      t.string :pick_up_location
      t.string :drop_off_location
      t.date :pick_up_date
      t.string :pick_up_time
      t.date :drop_off_date
      t.string :drop_off_time

      t.timestamps
    end
  end
end
