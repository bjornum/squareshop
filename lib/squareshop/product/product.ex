defmodule Squareshop.Products do

	# Imports
	import Ecto.Query

	#Alias
	alias Squareshop.Repo
	alias Squareshop.Products
	alias Squareshop.Products.Product


	#Add a product
	def create_product(productdata) do
		# Logger.debug("user_address = #{inspect(user_address)}")
		%Product{}
		|> Product.changeset(productdata)
		|> Repo.insert()
	end
	# Helper function to strip off the Struct from forms
	def change_product(%Product{} = products) do
		Product.changeset(products, %{})
	end

	# Listing all the products
	def list_products() do
		Repo.all(Product)
	end

	def get_product!(id) do
		 Repo.get!(Product, id)
	end

	def update_product(id, params) do
		product = Products.get_product!(id)

		product
		|> Product.changeset(params)
		|> Repo.change()
	end


end
