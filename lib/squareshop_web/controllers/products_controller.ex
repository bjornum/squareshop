defmodule SquareshopWeb.ProductsController do
  use SquareshopWeb, :controller
alias Squareshop.Products
alias Squareshop.Products.Product


  def index(conn, params) do
    product = Products.list_products(params)
    render conn, "index.html", product: product
  end
  
  def show(conn, %{"id" => id}) do
		product = Products.get_product!(id)
	  render conn, "product.html", product: product
	end

end
