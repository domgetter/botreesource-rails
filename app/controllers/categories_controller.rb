class CategoriesController < ApplicationController

  layout 'public'

  def index
    list
    render('list')
  end

  def new
    @category = Category.new()
  end

  def create

    image = Image.new(images_params)

    @category = Category.new(categories_params)
    @category.position = Category.where(status: 'active', type_id: params[:type_id]).length+1
    @category.status = "active"

    if @category.save

      image.category_id = @category.id
      image.save

      redirect_to(action: 'list')
    else
      render('new')
    end

  end

  def list

    @categories = Category.all
    
  end

  def show
  
    id = params[:id]
    @category = Category.find(id)
    @products = Product.where(category_id: id)

  end

  def edit

    @category = Category.find(params[:id])

  end

  def update

    image = Image.new(images_params)

    @category = Category.find(params[:id])

    if @category.update_attributes(categories_params)

      image.category_id = @category.id
      image.save

      redirect_to(action: 'list')
    else
      render('edit')
    end

  end

  def delete

    @category = Category.find(params[:id])

  end

  def destroy

    @category = Category.find(params[:id])
    @category.status = "deleted"

    if @category.save
      redirect_to(action: 'list')
    else
      render('delete')
    end

  end

  def recover

    @category = Category.find(params[:id])

  end

  def restore

    @category = Category.find(params[:id])
    @category.status = "active"

    if @category.save
      redirect_to(action: 'list')
    else
      render('recover')
    end

  end

  private

  def categories_params

    params.require(:category).permit(:image, :name, :type_id)

  end

  def images_params

    params.require(:category).require(:image).permit!

  end

end
