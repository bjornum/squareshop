defmodule SquareshopWeb.ProductsController do
  use SquareshopWeb, :controller
alias Squareshop.Products
alias Squareshop.Products.Product


  def index(conn, params) do
    products = Products.list_products(params)
    render conn, "index.html", products: products
  end
  def show(conn, %{"id" => id}) do
		product = Products.get_product!(id)
	    render conn, "product.html", product: product
	end

end
