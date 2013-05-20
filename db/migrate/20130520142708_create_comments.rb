class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.datetime :uptime
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
