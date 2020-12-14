class RemoveIsClosedFromRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :is_closed, :boolean
  end
end
