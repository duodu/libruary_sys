class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :books
  validates_presence_of :name, :message => "can't be null"
end
