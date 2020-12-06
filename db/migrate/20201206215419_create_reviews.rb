class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.user :belongs_to
      t.restaurant :belongs_to

      t.timestamps
    end
  end
end
