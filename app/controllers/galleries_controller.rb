class GalleriesController < ApplicationController

  layout'public'

  def index
    #grabs the types and their associated thumbnials
    @types = Type.where(status: 'active')
 end

 def show

  @type = Type.find(params[:id])
  @categories = Category.where(status: 'active')

 end

 

end
