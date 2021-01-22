defmodule Scheduler.Notifications do
  alias Scheduler.Notification
  alias Scheduler.Repo
  alias Ecto.Multi

  import Ecto.Query, warn: false

  def get_notifications_to_be_processed do
    {:ok, datetime_now} = DateTime.now("Etc/UTC")

    query = from(
      notification in Notification,
      where: notification.next_attempt <= ^datetime_now and notification.processed == false
    )
    |> Repo.all()
  end

  def process_notifications(list) do
    ids = Enum.map(list, &(&1.id))

    query = from(
      notification in Notification,
      where: notification.id in ^ids
    )

    Repo.update_all(query, set: [processed: true])
  end

  def get_not_proccesed_notitifications_count do
    Repo.one(
      from notification in Notification,
      where: notification.processed == false,
      select: count(notification.id)
    )
  end
end
