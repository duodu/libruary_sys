class Comment < ActiveRecord::Base
  attr_accessible :book_id, :content, :uptime, :user_id
  belongs_to :user
  belongs_to :book
  validates_presence_of :content, :message => "can't be null"
  validates_length_of :content, :minimum => 10, :message => "must over 10"
  validates_presence_of :uptime
  validates_presence_of :user_id
end
