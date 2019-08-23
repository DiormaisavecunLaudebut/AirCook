class AddNotesToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :precision, :integer
    add_column :reviews, :communication, :integer
    add_column :reviews, :cleanliness, :integer
    add_column :reviews, :quality, :integer
    add_column :reviews, :location, :integer
    add_column :reviews, :equipments, :integer
  end
end
