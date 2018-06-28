defmodule Squareshop.Products do

	# Imports
	use Ecto.Schema
	import Ecto.Changeset
	import Ecto.Query, only: [from: 2]

	#Alias
	alias Squareshop.Repo
	alias Squareshop.Products
	alias Squareshop.Products.Product
	require Logger


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

	# Listing all the products
	def list_products() do
		Repo.all(Product)
	end

	def list_products(params) do
		search_term = get_in(params, ["query"])
	
		Product
		|> Products.search(search_term)
		|> Repo.all()
	end

	def get_product!(id) do
		 Repo.get!(Product, id)
	end

	# Helper function
	def change_product(%Product{} = products) do
		Product.changeset(products, %{})
	end

	def update_product(%Product{} = product, attrs) do

		Logger.debug("i ran")
		product
		|> Product.changeset(attrs)
		|> Repo.update()
	end


end
