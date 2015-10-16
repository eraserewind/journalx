defmodule Journalx.LoggerHandler do
  use GenEvent
  require Logger

  def handle_event({:log, priority, message}, _) do
    Logger.info "Kernel event: #{inspect priority} - #{inspect message}"
    {:ok, nil}
  end

end
