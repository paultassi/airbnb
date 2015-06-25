class AddDescriptionAndAgeToUser < ActiveRecord::Migration
  def change
    add_column :users, :description, :string
    add_column :users, :age, :integer
  end
end
