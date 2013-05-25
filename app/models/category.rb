class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :books
  validates_presence_of :name, :message => "can't be null"
  validates_uniqueness_of :name, :message => "is already exists"
end