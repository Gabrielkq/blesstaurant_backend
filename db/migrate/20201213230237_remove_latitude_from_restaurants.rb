class RemoveLatitudeFromRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :latitude, :integer
  end
end
