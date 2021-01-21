use Mix.Config

config :scheduler, Scheduler.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "scheduler_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :scheduler, ecto_repos: [Scheduler.Repo]
