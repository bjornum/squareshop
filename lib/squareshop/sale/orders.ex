defmodule Squareshop.Sales.Orders do
  use Ecto.Schema
  import Ecto.Changeset


  schema "orders" do
    field :Shipping_address, :string
    field :products, :map
    field :status, :integer
    field :user, :integer

    timestamps()
  end

  @doc false
  def changeset(orders, attrs) do
    orders
    |> cast(attrs, [:user, :products, :Shipping_address, :status])
    |> validate_required([:user, :products, :Shipping_address, :status])
  end
end
