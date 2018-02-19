class AddLatitudeAndLongitudeToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :latitude, :decimal, { precision: 10, scale: 6 }
    add_column :messages, :longitude, :decimal, { precision: 10, scale: 6 }
  end
end