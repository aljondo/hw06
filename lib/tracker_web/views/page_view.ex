defmodule TrackerWeb.PageView do
  alias Tracker.Repo
  alias Tracker.Accounts.User
  alias Tracker.Social.Post
  use TrackerWeb, :view

  def get_underlings(id) do
    users = Repo.all(User)
    Enum.filter(users, fn(x) -> x.manager == id end)
  end

  def get_tasks_by_user(id) do
  	posts = Repo.all(Post)
  	Enum.filter(posts, fn(x) -> x.user_id == id end)
  end

end
