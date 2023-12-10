class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.integer    :category_id     , null: false
      t.integer    :condition_id     , null: false
      t.integer    :shipping_fee_id     , null: false
      t.integer    :prefecture_id     , null: false
      t.integer    :shipping_day_id     , null: false
      t.timestamps
    end
  end
end
