class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :flag
      t.references :post, index: true
      t.references :user

      t.timestamps null: false
    end
    add_foreign_key :likes, :posts
    add_foreign_key :likes, :users
  end
  def self.down
    drop_table :likes
  end
end
