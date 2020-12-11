class RemoveUrlFromRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :url, :string
  end
end
