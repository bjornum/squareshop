defmodule SquareshopWeb.Router do
  use SquareshopWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

	scope "/", SquareshopWeb do
		pipe_through :browser # Use the default browser stack
		get "/", PageController, :index
		get "/login", LoginController, :index
		get "/tos", TosController, :index
		get "/about", AboutController, :index
		get "/invoice", InvoiceController, :index
		get "/shopping", ShoppingController, :index
		resources "/products", ProductsController
		resources "/adminproducts", AdminProductsController
		resources "/adminuser", AdminUserController
    resources "/user", UserController
    get "/form", FormController, :index

    get "/sign-in", LoginController, :new
    post "/sign-in", LoginController, :create
    delete "/sign-out", LoginController, :delete
	end


  # Other scopes may use custom stacks.
  # scope "/api", SquareshopWeb do
  #   pipe_through :api
  # end
end
