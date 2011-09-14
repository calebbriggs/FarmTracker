require 'digest/sha2'

class User < ActiveRecord::Base
	validates :userName, :uniqueness => true, :presence => true
  has_many :Farms
end
