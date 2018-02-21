defmodule Tracker.Social.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tracker.Social.Post


  schema "posts" do
    field :completed, :boolean, default: false
    field :description, :string
    field :time, :integer
    field :title, :string
    belongs_to :user, Tracker.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:title, :description, :time, :completed, :user_id])
    |> validate_required([:title, :description, :time, :completed, :user_id])
  end
  #def changeset(%Post{} = post, attrs) do
    #post
    #|> cast(attrs, [:title, :description, :time, :completed])
    #|> validate_required([:title, :description, :time, :completed])
  #end
end
