class Animal < ActiveRecord::Base
  validates :tag, :uniqueness => true, :presence => true
  belongs_to :farm
end
