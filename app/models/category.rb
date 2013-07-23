class Category < ActiveRecord::Base

  has_many :products
  has_one :image
  belongs_to :type

  accepts_nested_attributes_for :image

end
