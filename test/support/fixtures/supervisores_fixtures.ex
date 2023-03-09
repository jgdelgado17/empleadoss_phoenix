defmodule EmpleadossPhoenix.SupervisoresFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `EmpleadossPhoenix.Supervisores` context.
  """

  @doc """
  Generate a supervisor.
  """
  def supervisor_fixture(attrs \\ %{}) do
    {:ok, supervisor} =
      attrs
      |> Enum.into(%{
        apellidos: "some apellidos",
        fecha_ingreso: ~D[2023-03-07],
        nombres: "some nombres"
      })
      |> EmpleadossPhoenix.Supervisores.create_supervisor()

    supervisor
  end
end
