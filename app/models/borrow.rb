class Borrow < ActiveRecord::Base
  attr_accessible :book_id, :uptime, :user_id
  belongs_to :user
  belongs_to :book
end
