class Stat < ActiveRecord::Base
  attr_accessible :name
  has_many :books
end
