class CreateKitchens < ActiveRecord::Migration[5.2]
  def change
    create_table :kitchens do |t|
      t.text :description
      t.string :location
      t.integer :price
      t.string :name
      t.boolean :oven
      t.boolean :microwave
      t.boolean :thermomix
      t.boolean :ricecooker
      t.boolean :pastry_set
      t.string :other
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
