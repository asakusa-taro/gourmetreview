class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :review
      t.references :user, foreign_key: true
      t.references :shop, foreign_key: true

      t.timestamps
      t.index [:review, :user_id, :shop_id], unique: true
    end
  end
end
