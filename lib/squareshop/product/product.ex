defmodule Squareshop.Products do

	# Imports
	use Ecto.Schema
	import Ecto.Changeset
	import Ecto.Query, only: [from: 2]

	#Alias
	alias Squareshop.Repo
	alias Squareshop.Products
	alias Squareshop.Products.Product


	#search function

	def search(query, search_term) do
		wildcard_search = "%#{search_term}%"
	
		from product in query,
		where: ilike(product.name, ^wildcard_search),
		or_where: ilike(product.summary, ^wildcard_search)
	end


	#Add a product
	def create_product(productdata) do
		# Logger.debug("user_address = #{inspect(user_address)}")
		%Product{}
		|> Product.changeset(productdata)
		|> Repo.insert()
	end


	def change_product(%Product{} = products) do
		Product.changeset(products, %{})
	end

	# Listing up all the products
	def list_products() do
		Repo.all(Product)
	end

	def get_product!(id) do
		 Repo.get!(Product, id)
	end
end
