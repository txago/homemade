class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]

  def index
    if params[:query].present?
      sql_query = " \
        products.name @@ :query \
        OR products.description @@ :query \
      "
      @products = Product.where(sql_query, query: "%#{params[:query]}%")
    else
      @products = Product.all
    end
  end

  def show
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

