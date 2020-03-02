class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
     if user_signed_in?
      @products = Product.all - current_user.products
    else
      @products = Product.where.not(quantity: 0)
    end
  end

  def my_products
    @products = current_user.products
  end

  def show
    if user_signed_in?
      @products = current_user.products
    end
    @order = Order.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.save
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity, :photo)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end

