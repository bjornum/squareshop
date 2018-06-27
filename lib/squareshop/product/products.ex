defmodule Squareshop.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset


  schema "products" do
    field :alternative_products, :integer
    field :base_price, :integer
    field :image, :map
    field :stock, :integer
    field :name, :string
    field :pnr, :string
    field :summary, :string
    field :supplier, :integer

    timestamps()
  end

  def list_products(params) do
    search_term = get_in(params, ["query"])

    Product
    |> Product.search(search_term)
    |> Repo.all()
  end

  def changeset(products, attrs) do
    products
    |> cast(attrs, [:name, :image, :pnr, :summary, :base_price, :stock, :supplier, :alternative_products])
    |> validate_required([:name, :pnr, :base_price, :stock, :supplier])
  end
end
