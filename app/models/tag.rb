class Tag < ActiveRecord::Base
  has_many :taggings

  validates :name, uniqueness: true
end
