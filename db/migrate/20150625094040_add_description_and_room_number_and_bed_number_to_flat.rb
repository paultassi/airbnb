class AddDescriptionAndRoomNumberAndBedNumberToFlat < ActiveRecord::Migration
  def change
    add_column :flats, :description, :string
    add_column :flats, :room_number, :integer
    add_column :flats, :bed_number, :integer
  end
end
