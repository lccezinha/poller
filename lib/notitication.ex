defmodule Scheduler.Notification do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__

  schema "notifications" do
    field :message, :string
    field :processed, :boolean
    field :next_attempt, :naive_datetime

    timestamps()
  end

  def changeset(struct, attributes) do
    struct
    |> cast(attributes, [:message, :processed, :next_attempt])
  end
end
