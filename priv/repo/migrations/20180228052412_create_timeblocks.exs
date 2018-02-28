defmodule Tracker.Repo.Migrations.CreateTimeblocks do
  use Ecto.Migration

  def change do
    create table(:timeblocks) do
      add :start_time, :time, null: false
      add :end_time, :time, null: false
      add :task_id, :integer, null: false

      timestamps()
    end

  end
end
