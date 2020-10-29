class CreateOpuses < ActiveRecord::Migration[6.0]
  def change
    create_table :opuses do |t|
      t.text       :title
      t.text       :description
      t.references :user,             foreign_key: true
      t.timestamps
    end
  end
end
