class CreateBorrows < ActiveRecord::Migration
  def change
    create_table :borrows do |t|
      t.integer :user_id
      t.integer :book_id
      t.datetime :uptime

      t.timestamps
    end
  end
end
