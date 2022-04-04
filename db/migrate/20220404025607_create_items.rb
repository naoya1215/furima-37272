class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text        :explanation
      t.integer     :status_id
      t.integer     :responsibility_id
      t.integer     :prefecture_id
      t.integer     :shipping_day_id
      t.integer     :price
      t.references  :user, null: false, foregin_key: true
      t.timestamps
    end
  end
end
