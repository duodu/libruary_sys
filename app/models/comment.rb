class Comment < ActiveRecord::Base
  attr_accessible :book_id, :content, :uptime, :user_id
  belongs_to :user
  belongs_to :book
end
