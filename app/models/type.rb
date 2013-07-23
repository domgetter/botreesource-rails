class Type < ActiveRecord::Base
 
  has_one :image
  has_many :categories

  accepts_nested_attributes_for :image

end
