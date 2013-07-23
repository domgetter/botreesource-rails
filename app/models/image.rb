class Image < ActiveRecord::Base

  belongs_to :product
  belongs_to :category
  belongs_to :type

  has_attached_file :image,
    styles: { large: '600x600>', small: '160x160>', :thumb => "60x60>" },
    default_url: "/images/:style/missing.png"

  def default?

    return self.default

  end


end
