defmodule Journalx.Listener do
  @moduledoc "Listens to `/dev/log` and `/dev/klog` using the `l2elog_port`."
  use GenServer

  @port_executable '/journalx_port'
  @port_options [{:packet, 2}, :use_stdio, :in]

  def start_link, do: GenServer.start_link(__MODULE__, [], [name: __MODULE__])

  def init(_) do
    {:ok, open_port}
  end

  def handle_call(:terminate, _from, port) do
    {:stop, :normal, :ok, port}
  end

  def handle_cast(_, port) do
    {:noreply, port}
  end

  def handle_info({port, {:data, [header | message]}}, port) do
    priority = rem(header, 8)
    :ok = GenEvent.notify(Journalx.GenEvent, {:log, priority, message})
    {:noreply, port}
  end

  def terminate(_reason, port) do
    if port, do: Port.close(port)
    :ok
  end

  def code_change(_, port, _) do
    if port, do: Port.close(port)
    {:ok, open_port}
  end

  defp open_port do
    Port.open({:spawn_executable, :code.priv_dir(:journalx) ++ @port_executable}, @port_options)
  end

end
