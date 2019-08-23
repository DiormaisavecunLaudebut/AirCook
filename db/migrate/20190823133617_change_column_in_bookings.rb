class ChangeColumnInBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference(:reviews, :kitchen)
  end
end
