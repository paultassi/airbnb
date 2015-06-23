class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.boolean :validated
      t.references :flat
      t.references :user

      t.timestamps null: false
    end
  end
end
