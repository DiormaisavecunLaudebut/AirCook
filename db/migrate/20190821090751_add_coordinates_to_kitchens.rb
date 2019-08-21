class AddCoordinatesToKitchens < ActiveRecord::Migration[5.2]
  def change
    add_column :kitchens, :latitude, :float
    add_column :kitchens, :longitude, :float
  end
end
