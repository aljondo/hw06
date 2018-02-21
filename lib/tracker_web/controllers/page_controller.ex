defmodule TrackerWeb.PageController do
  use TrackerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def tasks(conn, _params) do
    posts = Tracker.Social.list_posts()
    changeset = Tracker.Social.change_post(%Tracker.Social.Post{})
    render conn, "tasks.html", posts: posts, changeset: changeset
  end
end
