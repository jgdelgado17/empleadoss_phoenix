defmodule EmpleadossPhoenix.CajerosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `EmpleadossPhoenix.Cajeros` context.
  """

  @doc """
  Generate a cajero.
  """
  def cajero_fixture(attrs \\ %{}) do
    {:ok, cajero} =
      attrs
      |> Enum.into(%{
        apellidos: "some apellidos",
        fecha_ingreso: ~D[2023-03-07],
        horario_fin: 42,
        horario_inicio: 42,
        nombres: "some nombres"
      })
      |> EmpleadossPhoenix.Cajeros.create_cajero()

    cajero
  end
end
