defmodule Scheduler.Poller do
  use GenServer
  alias Scheduler.Notifications

  def start_link(_), do: GenServer.start_link(__MODULE__, %{})

  def init(state) do
    schedule_work()

    {:ok, state}
  end

  def handle_info(:work, state) do
    notifications = Notifications.get_notifications_to_be_processed()
    IO.puts("Notifications to process: #{length(notifications)}")

    if notifications != [] do
      Notifications.process_notifications(notifications)

      IO.puts("Still not processed: #{Notifications.get_not_proccesed_notitifications_count()}")

      schedule_work()
    else
      "Empty notifications"

      schedule_work()
    end

    {:noreply, state}
  end

  defp schedule_work do
    Process.send_after(self(), :work, 60000)
  end
end
