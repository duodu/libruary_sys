class AddDescriptionToUserBorrowBook < ActiveRecord::Migration
  def change
    add_column :user_borrow_books, :update, :datetime
  end
end
