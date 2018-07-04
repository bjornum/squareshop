defmodule SquareshopWeb.UserController do
  use SquareshopWeb, :controller

  alias Squareshop.Identity
  alias Squareshop.Identity.User
  alias Squareshop.Identity.Address

  def index(conn, _params) do
    users = Identity.list_users()
    render(conn, "index.html", users: users)
    # cond do
    #   user_id = Plug.Conn.get_session(conn, :current_user_id)
    #   if
    #   |> redirect(to: user_path(conn, :show, user_id)) 
    # end
  end

  def new(conn, _params) do
    changeset = Identity.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Identity.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: user_path(conn, :show, user))
	  {:error, %Ecto.Changeset{} = changeset} ->
			render(conn, "new.html", changeset: changeset)
	end
  end

  def show(conn, %{"id" => id}) do
		users = Identity.list_users()
		user = Identity.get_user!(id)
	    render conn, "show.html", users: users, user: user
	end

  # def show(conn, %{"id" => id}) do
  #      user = Repo.get(User, id)
  #      changeset = User.changeset(user)
  #      cond do
  #       user_id = Plug.Conn.get_session(conn, :current_user_id) ->
  #        conn
  #        |> render("show.html", user: user, changeset: changeset)
  #        :error ->
  #         conn
  #         |> put_flash(:info, "No Access")
  #         |> redirect(to: page_path(conn, :index))
  #       end        
  # end
   
  

  def edit(conn, %{"id" => id}) do
    user = Identity.get_user!(id)
    changeset = Identity.change_user(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Identity.get_user!(id)

    case Identity.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end
end
