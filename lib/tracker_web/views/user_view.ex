defmodule TrackerWeb.UserView do
  alias Tracker.Repo
  alias Tracker.Accounts.User
  use TrackerWeb, :view

  def get_user_by_id(id) do
    Repo.get(User, id)
  end

  def get_underlings(id) do
    users = Repo.all(User)
    Enum.filter(users, fn(x) -> x.manager == id end)
  end

  def all_users do
  	IO.inspect Repo.all(User)
  	users = Repo.all(User)
  	n = Enum.count(users)
  	all_users_loop(users, [], n)
  end

  def all_users_loop(users, users_dropdown, n) when n > 0 do
  	user = List.first(users)
  	option = {Map.get(user, :name), user.id}
  	new_users_dropdown = [option | users_dropdown]
  	new_users = List.delete_at(users, 0)
  	count = n - 1
  	all_users_loop(new_users, new_users_dropdown, count)
  end

  def all_users_loop(users, users_dropdown, n) do
    IO.inspect "THE DROPDOWN"
    IO.inspect users_dropdown
  	users_dropdown
  end
end
