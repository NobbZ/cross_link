import Config

config :cross_link, ecto_repos: [CrossLink.Repo]

config :cross_link, CrossLink.Repo,
  database: "cross_link",
  username: "user",
  password: "pass",
  hostname: "localhost",
  port: 55432
