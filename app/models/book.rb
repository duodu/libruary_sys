class Book < ActiveRecord::Base
  #书介绍，书名，书分类，书状态（1:已无，0:可借阅等），库存，最新借阅时间
  attr_accessible :bookinfo, :bookname, :category_id, :stat_id, :storage, :uptime
  belongs_to :category
  belongs_to :stat
  has_many :borrows
  has_many :users, :through => :borrows
end