class ProductsController < ApplicationController
   def index
    @product=Product.all
  end

  def new
    @product=Product.new
  end

  def create
    image_attributes = product_params[:image]
    product_params.delete(:image)
      @product=Product.new(product_params)
    if @product.save
      image_attributes[:photo].map {|img| Image.create(:photo => img, :entity => @product)} 
      redirect_to :action=> "index"
    else
       render "new"
    end
  end
  
  def show
    @product=Product.find params[:id]
  end

  def edit
    @product=Product.find params[:id]
  end
  
  def update
    image_attributes = product_params[:image]
    product_params.delete(:image)
    @product=Product.find (params[:id])
    if @product.update(product_params)
       redirect_to :action=> "index"
    else
       render "edit"
    end
  end

  def destroy
   @product=Product.find params[:id]
   @product.delete
   redirect_to :action=>"index"
  end

  def logout
    session[:product_id]=nil
    redirect_to root_path
  end

  private
  def product_params
    params.require(:product).permit!
  end
end
