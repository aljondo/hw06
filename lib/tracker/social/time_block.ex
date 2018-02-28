defmodule Tracker.Social.TimeBlock do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tracker.Social.TimeBlock


  schema "timeblocks" do
    field :end_time, :time
    field :start_time, :time
    field :task_id, :integer

    timestamps()
  end

  @doc false
  def changeset(%TimeBlock{} = time_block, attrs) do
    time_block
    |> cast(attrs, [:start_time, :end_time, :task_id])
    |> validate_required([:start_time, :end_time, :task_id])
  end
end
