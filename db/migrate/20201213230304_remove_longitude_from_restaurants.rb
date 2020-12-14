class RemoveLongitudeFromRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :longitude, :integer
  end
end
