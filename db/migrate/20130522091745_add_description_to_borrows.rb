class AddDescriptionToBorrows < ActiveRecord::Migration
  def change
    add_column :borrows, :is_return, :integer
  end
end
