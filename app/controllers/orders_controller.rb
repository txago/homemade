class OrdersController < ApplicationController
  before_action :set_order, only: ['show' 'destroy']

  def show
    @order = Order.new
  end

  def checkout
    @orders = current_user.orders.where(purchased: false)
  end

  def new
    @product = Product.find(params[:product_id])
    @order = Order.new
  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new
    @order.product = @product
    @order.user = current_user
    @order.purchased = false


    if @product.quantity.positive? && @order.save
      @product.quantity -= 1
      @product.save
      redirect_to checkout_path
    else
      render 'products/show'
    end
  end

  def destroy
    @order.destroy
    redirect_to products_path(@order.product)
  end

  private

  def order_params
    params.require(:product).permit(:delivery_address, :user_id, :product_id)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
