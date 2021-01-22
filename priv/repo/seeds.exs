alias Scheduler.Notification

{:ok, datetime_now} = DateTime.now("Etc/UTC")
base_seconds = 1

Enum.each(1..60, fn(item) ->
  %Notification{
    message: "Message ##{item}",
    processed: false,
    next_attempt: DateTime.add(datetime_now, base_seconds * item, :second)
  }
  |> Scheduler.Repo.insert()
end)
