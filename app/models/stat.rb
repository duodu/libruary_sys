class Stat < ActiveRecord::Base
  attr_accessible :name
  has_many :books
  validates_presence_of :name
end
