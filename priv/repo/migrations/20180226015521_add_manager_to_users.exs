defmodule Tracker.Repo.Migrations.AddManagerToUsers do
  use Ecto.Migration

  def change do
  	alter table(:users) do
  		add :manager, :integer
  	end
  end
end
