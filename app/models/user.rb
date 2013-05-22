class User < ActiveRecord::Base
  #用户类别（标记），用户密码，用户名
  attr_accessible :flag_id, :password, :username
  has_many :borrows
  has_many :books, :through => :borrows
  has_many :comments
  belongs_to :flag
end