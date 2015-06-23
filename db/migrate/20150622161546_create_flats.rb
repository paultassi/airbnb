class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.string :city
      t.string :street
      t.integer :price
      # t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
