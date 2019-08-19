class AddPhotoToKitchens < ActiveRecord::Migration[5.2]
  def change
    add_column :kitchens, :photo, :string
  end
end
