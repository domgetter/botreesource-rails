class Product < ActiveRecord::Base


  belongs_to :category
  has_many :images

  accepts_nested_attributes_for :images

  def dimensions

    output = ""
    output += self.length.to_s + "L\"" if self.length
    output += "x" + self.width + "W\"" if self.width
    output += "x" + self.height + "H\"" if self.height
    return output

  end

  def default_image_url

    image = self.images.detect {|image| image.default? }

    if image
      return image.image.url
    else
      return ""
    end

  end

  def next_item_id
    
    if next_product = Product.find_by(position: self.position.to_i+1)
      return next_product.id
    else
      1 
    end

  end

  def prev_item_id

    if prev_product = Product.find_by(position: self.position.to_i-1)
      return prev_product.id
    else
      1 
    end

  end
end
