class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @products = Product.where.not(quantity: 0)
  end

  def index
    @products = Product.all
  end
end
