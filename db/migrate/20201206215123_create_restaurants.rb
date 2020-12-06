class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :yelp_id
      t.string :name
      t.string :image_url
      t.boolean :is_closed
      t.string :url
      t.integer :latitude
      t.integer :longitude
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
