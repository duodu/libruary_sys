class User < ActiveRecord::Base
  #用户类别（标记），用户密码，用户名
  attr_accessible :flag_id, :password, :username, :password_confirmation
  has_many :borrows
  has_many :books, :through => :borrows
  has_many :comments
  belongs_to :flag
  validates_presence_of :username, :message => "can't be null"
  validates_length_of :username, :minimum => 5, :message => "must be over 5"
  validates_presence_of :password, :message => "can't be null"
  validates_length_of :password, :minimum => 6, :message => "must be over 6"
  validates_confirmation_of :password,  :message => "confirm password is not the same"
  validates_uniqueness_of :username,  :case_sensitive => true, :message => "has been already exit"
end