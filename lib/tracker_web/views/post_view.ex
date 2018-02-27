defmodule TrackerWeb.PostView do
  alias Tracker.Repo
  alias Tracker.Accounts.User
  use TrackerWeb, :view

  def get_underlings(id) do
    users = Repo.all(User)
    underlings = Enum.filter(users, fn(x) -> x.manager == id end)
    n = Enum.count(underlings)
    IO.puts "uh"
    IO.inspect underlings
    underlings_dropdown(underlings, [], n)
  end

  def underlings_dropdown(users, underlings_dropdown, n) when n > 0 do
  	user = List.first(users)
  	option = {Map.get(user, :name), user.id}
  	new_users_dropdown = [option | underlings_dropdown]
  	new_users = List.delete_at(users, 0)
  	count = n - 1
  	underlings_dropdown(new_users, new_users_dropdown, count)
  end

  def underlings_dropdown(users, underlings_dropdown, n) do
  	underlings_dropdown
  end
end
