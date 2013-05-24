class Borrow < ActiveRecord::Base
  attr_accessible :book_id, :uptime, :user_id, :is_return #(0：归还；1：未归还)
  belongs_to :user
  belongs_to :book
  validates_presence_of :uptime
  validates_presence_of :is_return
  validates_presence_of :book_id
  validates_presence_of :user_id
end