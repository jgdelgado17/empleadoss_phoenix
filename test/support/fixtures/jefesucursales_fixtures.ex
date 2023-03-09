defmodule EmpleadossPhoenix.JefesucursalesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `EmpleadossPhoenix.Jefesucursales` context.
  """

  @doc """
  Generate a jefesucursal.
  """
  def jefesucursal_fixture(attrs \\ %{}) do
    {:ok, jefesucursal} =
      attrs
      |> Enum.into(%{
        apellidos: "some apellidos",
        fecha_ingreso: ~D[2023-03-07],
        nombres: "some nombres"
      })
      |> EmpleadossPhoenix.Jefesucursales.create_jefesucursal()

    jefesucursal
  end
end
