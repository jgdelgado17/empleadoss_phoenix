defmodule EmpleadossPhoenix.JefesucursalesTest do
  use EmpleadossPhoenix.DataCase

  alias EmpleadossPhoenix.Jefesucursales

  describe "jefesucursal" do
    alias EmpleadossPhoenix.Jefesucursales.Jefesucursal

    import EmpleadossPhoenix.JefesucursalesFixtures

    @invalid_attrs %{apellidos: nil, fecha_ingreso: nil, nombres: nil}

    test "list_jefesucursal/0 returns all jefesucursal" do
      jefesucursal = jefesucursal_fixture()
      assert Jefesucursales.list_jefesucursal() == [jefesucursal]
    end

    test "get_jefesucursal!/1 returns the jefesucursal with given id" do
      jefesucursal = jefesucursal_fixture()
      assert Jefesucursales.get_jefesucursal!(jefesucursal.id) == jefesucursal
    end

    test "create_jefesucursal/1 with valid data creates a jefesucursal" do
      valid_attrs = %{apellidos: "some apellidos", fecha_ingreso: ~D[2023-03-07], nombres: "some nombres"}

      assert {:ok, %Jefesucursal{} = jefesucursal} = Jefesucursales.create_jefesucursal(valid_attrs)
      assert jefesucursal.apellidos == "some apellidos"
      assert jefesucursal.fecha_ingreso == ~D[2023-03-07]
      assert jefesucursal.nombres == "some nombres"
    end

    test "create_jefesucursal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Jefesucursales.create_jefesucursal(@invalid_attrs)
    end

    test "update_jefesucursal/2 with valid data updates the jefesucursal" do
      jefesucursal = jefesucursal_fixture()
      update_attrs = %{apellidos: "some updated apellidos", fecha_ingreso: ~D[2023-03-08], nombres: "some updated nombres"}

      assert {:ok, %Jefesucursal{} = jefesucursal} = Jefesucursales.update_jefesucursal(jefesucursal, update_attrs)
      assert jefesucursal.apellidos == "some updated apellidos"
      assert jefesucursal.fecha_ingreso == ~D[2023-03-08]
      assert jefesucursal.nombres == "some updated nombres"
    end

    test "update_jefesucursal/2 with invalid data returns error changeset" do
      jefesucursal = jefesucursal_fixture()
      assert {:error, %Ecto.Changeset{}} = Jefesucursales.update_jefesucursal(jefesucursal, @invalid_attrs)
      assert jefesucursal == Jefesucursales.get_jefesucursal!(jefesucursal.id)
    end

    test "delete_jefesucursal/1 deletes the jefesucursal" do
      jefesucursal = jefesucursal_fixture()
      assert {:ok, %Jefesucursal{}} = Jefesucursales.delete_jefesucursal(jefesucursal)
      assert_raise Ecto.NoResultsError, fn -> Jefesucursales.get_jefesucursal!(jefesucursal.id) end
    end

    test "change_jefesucursal/1 returns a jefesucursal changeset" do
      jefesucursal = jefesucursal_fixture()
      assert %Ecto.Changeset{} = Jefesucursales.change_jefesucursal(jefesucursal)
    end
  end
end
