class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :content
      t.string :business_hours
      t.string :address
      t.string :hp
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
