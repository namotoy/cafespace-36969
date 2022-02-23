class CreateCafetypes < ActiveRecord::Migration[6.0]
  def change
    create_table :cafetypes do |t|
      t.string  :shop_name ,     null: false
      t.text    :catch_copy ,    null: false
      t.integer :prefecture_id,  null: false
      t.string  :city,           null: false
      t.string  :block_number,   null: false
      t.integer :wifi,           null: false
      t.integer :power_supply,   null: false
      t.integer :capacity,       null: false
      t.integer :toilet_place,   null: false
      t.integer :cafe_price,     null: false
      t.references :user,        null: false,foreign_key: true
      t.timestamps
    end
  end
end
