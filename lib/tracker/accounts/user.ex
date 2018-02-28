defmodule Tracker.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tracker.Accounts.User


  schema "users" do
    field :email, :string
    field :name, :string
    field :manager, :integer
    
    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    IO.puts "CHANGE SET UGH"
    IO.inspect attrs
    user
    |> cast(attrs, [:email, :name, :manager])
    |> validate_required([:email, :name, :manager])
  end
end
