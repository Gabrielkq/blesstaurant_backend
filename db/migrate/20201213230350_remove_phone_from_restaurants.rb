class RemovePhoneFromRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :phone, :string
  end
end
