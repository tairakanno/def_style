class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text       :name,   null:false
      t.text       :text,   null:false
      t.integer    :days_to_ship_id,  unll:false
      t.integer    :price,            unll:false
      t.references :user,             foreign_kye: true
      t.timestamps
    end
  end
end
