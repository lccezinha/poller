defmodule Scheduler.Repo.Migrations.CreateNotifications do
  use Ecto.Migration

  def change do
    create table(:notifications) do
      add :message, :text
      add :processed, :boolean, default: false
      add :next_attempt, :naive_datetime

      timestamps()
    end
  end
end
