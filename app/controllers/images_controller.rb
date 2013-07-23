class ImagesController < ApplicationController

  layout 'public'

  def index
    list
  end

  def list

  end

  def new

  end




  def create

    @image = Image.new(images_params)
    
    if @image.save
      redirect_to(action: 'list')
    else
      render('new')
    end 

  end


  private

  def images_params

    params.require(:image).permit!

  end

end
