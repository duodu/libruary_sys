class Book < ActiveRecord::Base
  #书介绍，书名，书分类，书状态（1:已无，0:可借阅等），库存，最新借阅时间
  attr_accessible :bookinfo, :bookname, :category_id, :stat_id, :storage, :uptime
  belongs_to :category
  belongs_to :stat
  has_many :borrows
  has_many :users, :through => :borrows
  validates_presence_of :bookname, :message => "can't be null"
  validates_length_of :bookname, :minimum => 5, :message => "must be over 5"
  validates_presence_of :bookinfo, :message => "can't be null"
  validates_length_of :bookinfo, :minimum => 10, :message => "must be over 10"
  validates_presence_of :category_id, :message => "can't be null"
  validates_presence_of :stat_id, :message => "can't be null"
  validates_presence_of :storage, :message => "can't be null"
  validates_presence_of :uptime, :message => "can't be null"
  validates :storage, :numericality => {:only_integer => true}
end