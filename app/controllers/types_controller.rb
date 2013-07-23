class TypesController < ApplicationController

  layout 'public'

  def index
    list
    render('list')
  end

  def new

    @type = Type.new()

  end

  def create

    image = Image.new(images_params)

    @type = Type.new(types_params)
    @type.position = Type.where(status: 'active').length + 1
    @type.status = "active"

    if @type.save

      image.type_id = @type.id
      image.save

      redirect_to(action: 'list')
    else
      render('new')
    end

  end

  def list

    @types = Type.all

  end

  def show

    id = params[:id]
    @type = Type.find(id)
    @categories = Category.where(type_id: id)

  end

  def edit

    @type = Type.find(params[:id])

  end

  def update

    image = Image.new(images_params)
    @type = Type.find(params[:id])
    
    if @type.update_attributes(types_params)

      image.type_id = @type.id
      image.save

      redirect_to(action: 'list')
    else
      render('edit')
    end

  end


  def delete

    @type = Type.find(params[:id])

  end

  def undelete

    @type = Type.find(params[:id])

  end

  def undestroy

    @type = Type.find(params[:id])
    @type.status = "active"

    if @type.save
      redirect_to(action: 'list')
    else
      render('undelete')
    end
 

  end

  def destroy

    @type = Type.find(params[:id])
    @type.status = "deleted"
    
    if @type.save
      redirect_to(action: 'list')
    else
      render('delete')
    end

  end

  private

  def types_params
    
    params.require(:type).permit(:position, :name, :image)

  end

  def images_params

    params.require(:type).require(:image).permit!

  end

end
