class ProductsController < ApplicationController
  def search_products
    query = params[:q]
    products = Product.where("name ILIKE ?", "%#{query}%").limit(10)
    render json: products
  end
end
