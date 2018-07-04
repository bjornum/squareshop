defmodule Squareshop.Identity do

#Importing functions
	import Ecto.Query

#Setting up Aliases
	alias Squareshop.Repo
	alias Squareshop.Identity
	alias Squareshop.Identity.User
	alias Ecto.Multi
	require Logger

#Add a new user
	def create_user(attrs \\ %{}) do
		%User{}
		|> User.changeset(attrs)
		|> Repo.insert()
	end

	def get_by_email(email) when is_nil(email) do
		nil
	end
	def get_by_email(email) do
		Repo.get_by(User, email: email)
	end

#Get all the CreateUsers
	def list_users do
		Repo.all(User)
	end
#Get a single user
	 def get_user!(id) do
		 Repo.get!(User, id)
	end

	# def get_address!(id) do
	# 	user_id = Kernel.elem(Integer.parse(id), 0)
	# 	query = from u in "addresses", where: u.user_id == ^user_id, select: [:address, :country, :city, :zip_code]
	# 	Repo.all(query)
	#end
	def finduser(name) do
		query = from u in "users", where: u.fname == ^name, select: [:id]
		Repo.all(query)
	end
	def finduser(term) do
		IO.puts("Error: You really shouldn't have done that")
	end
	def finduser(term , key) do
		if key == :lname do
			query = from u in "users", where: u.lname == ^term, select: [:id]
			Repo.all(query)
		end
		if key == :fname do
			query = from u in "users", where: u.fname == ^term, select: [:id]
			Repo.all(query)
		end
	end

	def remove_user(user) do
		Repo.get!(User, user)
		|>Repo.delete()
	end

	def change_user(%User{} = user) do
		User.changeset(user, %{})
	end
	
	def update_user(%User{} = user, attrs) do
		
		Logger.debug("i ran")
		user
		|> User.changeset(attrs)
		|> Repo.update()
		
	 end  


end
