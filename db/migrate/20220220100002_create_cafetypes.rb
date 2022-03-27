class CreateCafetypes < ActiveRecord::Migration[6.0]
  def change
    create_table :cafetypes do |t|
      t.string  :shop_name ,     null: false
      t.text    :catch_copy ,    null: false
      t.integer :prefecture_id,  null: false
      t.string  :city,           null: false
      t.string  :block_number,   null: false
      t.integer :wifi_id,        null: false
      t.integer :power_supply_id,null: false
      t.integer :capacity_id,    null: false
      t.integer :toilet_place_id,null: false
      t.integer :cafe_price,     null: false
      t.references :user,        null: false,foreign_key: true
      t.timestamps
    end
    add_column :cafetypes, :address, :string
    add_column :cafetypes, :latitude, :float
    add_column :cafetypes, :longitude, :float
  end
end
