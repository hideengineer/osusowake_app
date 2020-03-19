class ProductsController < ApplicationController
  def index
    @product = Product.all.order(created_at: :desc)
  end

  def new
    @product = Product.new
    @product.images.build
  end

  def create
    @product = current_user.products.build(product_params)
    @product.user_id = current_user.id
    if @product.save
      redirect_to root_path
    else
      redirect_to new_products_path
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :user_id, :status, :image_id, images_attributes: [:src, :product])
  end
end
