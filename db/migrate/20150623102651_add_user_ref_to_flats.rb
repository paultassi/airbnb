class AddUserRefToFlats < ActiveRecord::Migration
  def change
    add_reference :flats, :user, index: true, foreign_key: true
  end
end
