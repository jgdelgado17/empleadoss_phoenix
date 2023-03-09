defmodule EmpleadossPhoenixWeb.JefesucursalJSON do
  alias EmpleadossPhoenix.Jefesucursales.Jefesucursal

  @doc """
  Renders a list of jefesucursal.
  """
  def index(%{jefesucursal: jefesucursal}) do
    %{data: for(jefesucursal <- jefesucursal, do: data(jefesucursal))}
  end

  @doc """
  Renders a single jefesucursal.
  """
  def show(%{jefesucursal: jefesucursal}) do
    %{data: data(jefesucursal)}
  end

  defp data(%Jefesucursal{} = jefesucursal) do

    IO.puts("\n*********************************************\n")
    IO.inspect(jefesucursal)
    IO.puts("\n*********************************************\n")

    supervisor =
      case is_list(jefesucursal.supervisor) do
        false ->
          []

        true ->
          jefesucursal.supervisor
          |> Enum.map(&Map.from_struct(&1))
          |> Enum.map(
            &Enum.reduce([:__meta__, :jefesucursal, :cajero, :inserted_at, :update_at], &1, fn key, acc ->
              Map.delete(acc, key)
            end)
          )
      end

    %{
      id: jefesucursal.id,
      nombres: jefesucursal.nombres,
      apellidos: jefesucursal.apellidos,
      fecha_ingreso: jefesucursal.fecha_ingreso,
      supervisor: supervisor
    }
  end
end
