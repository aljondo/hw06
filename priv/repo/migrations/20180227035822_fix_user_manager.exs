defmodule Tracker.Repo.Migrations.FixUserManager do
  use Ecto.Migration

  def change do
  	alter table(:users) do
  		modify :manager, :integer
  	end
  end
end
