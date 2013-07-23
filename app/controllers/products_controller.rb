class ProductsController < ApplicationController

  layout 'public'

  def index
    list
    render('list')
  end

  def new
    @product = Product.new()
   
  end

  def create
    image = Image.new(images_params)
     
    puts "IMAGE IS RIGHT HERE: " + image.inspect
   # puts params[:images][:image]
    
    @product = Product.new(products_params)
    @product.status = "active"
    if @product.save
     image.product_id = @product.id
     image.save
     redirect_to(action: 'list')
    else
      render('new')
    end

  end

  def list

    @products = Product.all
    #@products.each do |product|
    

    #@images = Image.all

  end

  def show

    @product = Product.find(params[:id])

  end

  def edit

    @product = Product.find(params[:id])

  end

  def update

    @product = Product.find(params[:id])

    if @product.update_attributes(products_params)
      redirect_to(action: 'list')
    else
      render('edit')
    end

  end

  def delete

    @product = Product.find(params[:id])

  end

  def destroy

    @product = Product.find(params[:id])
    @product.status = "deleted"

    if @product.save
      redirect_to(action: 'list')
    else
      render('delete')
    end

  end

  def recover

    @product = Product.find(params[:id])

  end

  def restore

    @product = Product.find(params[:id])
    @product.status = "active"

    if @product.save
      redirect_to(action: 'list')
    else
      render('recover')
    end

  end

  private

  def products_params

    params.require(:product).permit(:images, :position, :name, :identifier, :length, :width, :category_id, :height, :description)

  end

  def images_params

    params.require(:product).require(:images).permit!

  end

end
