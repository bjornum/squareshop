defmodule Squareshop.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :user, :integer
      add :products, :map
      add :Shipping_address, :string
      add :status, :integer

      timestamps()
    end

  end
end
