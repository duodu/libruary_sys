class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :bookname
      t.string :bookinfo
      t.datetime :uptime
      t.integer :category_id
      t.integer :storage
      t.integer :stat_id

      t.timestamps
    end
  end
end
