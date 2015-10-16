defmodule Mix.Tasks.Compile.Journalx do
  @shortdoc "Compiles `l2elog_port`."

  def run(_) do
    case System.cmd("make", ["priv/journalx_port"], stderr_to_stdout: true) do
      {result, 0} ->
        IO.binwrite result
      {result, exit_code} ->
        Mix.shell.error "Failed to make journalx_port, exit code #{inspect exit_code}"
        IO.binwrite result
        throw(:failed_to_compile_journalx_port)
    end
  end
end

defmodule Journalx.Mixfile do
  use Mix.Project

  def project do
    [app: :journalx,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     compilers: [:journalx, :elixir, :app],
     ]
  end

  def application do
    [applications: [:logger],
     mod: {Journalx, []}]
  end

  defp deps do
    []
  end
end
