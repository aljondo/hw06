defmodule TrackerWeb.PostController do
  use TrackerWeb, :controller

  alias Tracker.Social
  alias Tracker.Social.Post

  def index(conn, _params) do
    posts = Social.list_posts()
    render(conn, "index.html", posts: posts)
  end

  def new(conn, _params) do
    changeset = Social.change_post(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    case Social.create_post(post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: "/tasks")
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    post = Social.get_post!(id)
    render(conn, "show.html", post: post)
  end

  def edit(conn, %{"id" => id}) do
    post = Social.get_post!(id)
    changeset = Social.change_post(post)
    render(conn, "edit.html", post: post, changeset: changeset)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Social.get_post!(id)

    case Social.update_post(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Task updated successfully.")
        |> redirect(to: "/tasks")
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", post: post, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Social.get_post!(id)
    {:ok, _post} = Social.delete_post(post)

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: "/tasks")
  end
end
