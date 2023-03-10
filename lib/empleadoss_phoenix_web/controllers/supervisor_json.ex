defmodule EmpleadossPhoenixWeb.SupervisorJSON do
  alias EmpleadossPhoenix.Supervisores.Supervisor

  @doc """
  Renders a list of supervisor.
  """
  def index(%{supervisor: supervisor}) do
    %{data: for(supervisor <- supervisor, do: data(supervisor))}
  end

  def mascajeros(%{supervisor: supervisor}) do
    supervisor = Enum.at(supervisor, 0)
    supervisor = Map.get(supervisor, :supervisor)
    %{data: data(supervisor)}
  end

  @doc """
  Renders a single supervisor.
  """
  def show(%{supervisor: supervisor}) do
    %{data: data(supervisor)}
  end

  defp data(%Supervisor{} = supervisor) do
    IO.puts("\n*********************************************\n")
    IO.inspect(supervisor)
    IO.puts("\n*********************************************\n")

    jefesucursal =
      case is_list(supervisor.jefesucursal) do
        false ->
          []

        true ->
          [supervisor.jefesucursal]
          |> Enum.map(&Map.from_struct(&1))
          |> Enum.map(
            &Enum.reduce(
              [:__meta__, :supervisor, :inserted_at, :update_at],
              &1,
              fn key, acc ->
                Map.delete(acc, key)
              end
            )
          )
          |> List.first()
      end

    cajero =
      case is_list(supervisor.cajero) do
        false ->
          []

        true ->
          supervisor.cajero
          |> Enum.map(&Map.from_struct(&1))
          |> Enum.map(
            &Enum.reduce(
              [:__meta__, :supervisor, :inserted_at, :update_at],
              &1,
              fn key, acc ->
                Map.delete(acc, key)
              end
            )
          )
      end

    %{
      id: supervisor.id,
      nombres: supervisor.nombres,
      apellidos: supervisor.apellidos,
      fecha_ingreso: supervisor.fecha_ingreso,
      jefesucursal: jefesucursal,
      cajero: cajero
    }
  end
end
