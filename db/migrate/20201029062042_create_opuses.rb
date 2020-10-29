class CreateOpuses < ActiveRecord::Migration[6.0]
  def change
    create_table :opuses do |t|
      t.text       :title,            null: false
      t.text       :description,      null: false
      t.references :user,             foreign_key: true
      t.timestamps
    end
  end
end
