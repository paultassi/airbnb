class AddHouseTypeToFlat < ActiveRecord::Migration
  def change
    add_column :flats, :house_type, :string
  end
end
