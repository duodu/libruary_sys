class User < ActiveRecord::Base
  attr_accessible :flag_id, :password, :username
  has_many :books, :through => :borrows
  has_many :comments
  belongs_to :flag
end
