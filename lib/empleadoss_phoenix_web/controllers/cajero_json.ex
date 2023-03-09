defmodule EmpleadossPhoenixWeb.CajeroJSON do
  alias EmpleadossPhoenix.Cajeros.Cajero

  @doc """
  Renders a list of cajero.
  """
  def index(%{cajero: cajero}) do
    %{data: for(cajero <- cajero, do: data(cajero))}
  end

  @doc """
  Renders a single cajero.
  """
  def show(%{cajero: cajero}) do
    %{data: data(cajero)}
  end

  defp data(%Cajero{} = cajero) do
    IO.puts("\n*********************************************\n")
    IO.inspect(cajero)
    IO.puts("\n*********************************************\n")

    supervisor =
      case is_list(cajero.supervisor) do
        false ->
          []

        true ->
          [cajero.supervisor]
          |> Enum.map(&Map.from_struct(&1))
          |> Enum.map(
            &Enum.reduce([:__meta__, :cajero, :inserted_at, :update_at], &1, fn key, acc ->
              Map.delete(acc, key)
            end)
          )
          |> List.first()
      end

    %{
      id: cajero.id,
      nombres: cajero.nombres,
      apellidos: cajero.apellidos,
      fecha_ingreso: cajero.fecha_ingreso,
      horario_inicio: cajero.horario_inicio,
      horario_fin: cajero.horario_fin,
      supervisor: supervisor
    }
  end
end
