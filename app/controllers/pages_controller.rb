class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    products = Product.all
    @latest = products.last(4)
    @top = products.sort_by { |product| product.orders.count }.last(4).reverse
  end

  def index
    @products = Product.all
  end
end
