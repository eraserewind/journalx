defmodule Journalx do
  use Application

  @moduledoc """
  # journalx

  ## Events

  * `{:log, priority :: 0..7, message :: String.t}`

  """

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(GenEvent, [[name: Journalx.GenEvent]], []),
      worker(Journalx.Listener, []),
    ]

    opts = [strategy: :one_for_one, name: Journalx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def add_handler(module, options \\ []) do
    GenEvent.add_handler(Journalx.GenEvent, module, options)
  end

  def remove_handler(module, options \\ []) do
    GenEvent.remove_handler(Journalx.GenEvent, module, options)
  end

end
