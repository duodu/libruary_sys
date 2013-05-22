class Borrow < ActiveRecord::Base
  attr_accessible :book_id, :uptime, :user_id, :is_return #(0：为归还；1：未归还)
  belongs_to :user
  belongs_to :book
end