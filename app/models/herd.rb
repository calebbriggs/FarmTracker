class Herd < ActiveRecord::Base
  belongs_to :farm
  has_many :Animals
end
