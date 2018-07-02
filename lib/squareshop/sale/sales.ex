defmodule Squareshop.Sales do
	#importing functions
		require Stripe
		import Ecto.Query
	#Setting up aliases
		alias Squareshop.Repo
		alias Squareshop.Sales
		alias Squareshop.Sales.Orders
		alias Squareshop.Identity
		alias Squareshop.Products
		alias Stripe
		alias Stripe.Charge


	def stripetest do
		 # obtained with Stripe.js
		Stripe.Charge.create(%{amount: 2000, currency: "nok", source: "tok_mastercard", description: "Charge for madison.anderson@example.com"})
	end

	def create_order(user_id, card) do
		user = Identity.get_user!(user_id)

		# for product <= user.shopping_cart do
		# Products.get_product!()
		# end



		Stripe.Charge.create(card)
	end

end
