class Animal < ActiveRecord::Base
  validates :tag, :uniqueness => true, :presence => true
  belongs_to :farm
  belongs_to :herd
end
