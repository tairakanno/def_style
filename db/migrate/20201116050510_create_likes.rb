class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :opus, foreign_key: true, null: false
      t.timestamps
      t.index [:user_id, :opus_id], unique: true
    end
  end
end
