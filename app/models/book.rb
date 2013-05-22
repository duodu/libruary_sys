class Book < ActiveRecord::Base
  #书介绍，书名，书分类，书状态（已无，可借阅等），库存，更新时间
  attr_accessible :bookinfo, :bookname, :category_id, :stat_id, :storage, :uptime
  belongs_to :category
  belongs_to :stat
  has_many :borrows
  has_many :users, :through => :borrows
end