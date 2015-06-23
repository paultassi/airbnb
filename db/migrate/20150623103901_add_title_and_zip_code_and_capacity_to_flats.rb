class AddTitleAndZipCodeAndCapacityToFlats < ActiveRecord::Migration
  def change
    add_column :flats, :title, :string
    add_column :flats, :zip_code, :integer
    add_column :flats, :capacity, :integer
  end
end
