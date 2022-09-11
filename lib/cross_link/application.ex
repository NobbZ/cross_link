defmodule CrossLink.Application do
  use Application

  def start(_, []) do
    Supervisor.start_link(
      [
        CrossLink.Repo
      ],
      strategy: :one_for_one
    )
  end
end
