class Farm < ActiveRecord::Base
  validates :user , :presence => true
  belongs_to :user
  has_many :Animals
  has_many :Herds
end
