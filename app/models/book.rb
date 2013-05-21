class Book < ActiveRecord::Base
  attr_accessible :bookinfo, :bookname, :category_id, :stat_id, :storage, :uptime
  belongs_to :category
  belongs_to :stat
  has_many :borrows
  has_many :users, :through => :borrows
end