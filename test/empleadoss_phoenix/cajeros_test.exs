defmodule EmpleadossPhoenix.CajerosTest do
  use EmpleadossPhoenix.DataCase

  alias EmpleadossPhoenix.Cajeros

  describe "cajero" do
    alias EmpleadossPhoenix.Cajeros.Cajero

    import EmpleadossPhoenix.CajerosFixtures

    @invalid_attrs %{apellidos: nil, fecha_ingreso: nil, horario_fin: nil, horario_inicio: nil, nombres: nil}

    test "list_cajero/0 returns all cajero" do
      cajero = cajero_fixture()
      assert Cajeros.list_cajero() == [cajero]
    end

    test "get_cajero!/1 returns the cajero with given id" do
      cajero = cajero_fixture()
      assert Cajeros.get_cajero!(cajero.id) == cajero
    end

    test "create_cajero/1 with valid data creates a cajero" do
      valid_attrs = %{apellidos: "some apellidos", fecha_ingreso: ~D[2023-03-07], horario_fin: 42, horario_inicio: 42, nombres: "some nombres"}

      assert {:ok, %Cajero{} = cajero} = Cajeros.create_cajero(valid_attrs)
      assert cajero.apellidos == "some apellidos"
      assert cajero.fecha_ingreso == ~D[2023-03-07]
      assert cajero.horario_fin == 42
      assert cajero.horario_inicio == 42
      assert cajero.nombres == "some nombres"
    end

    test "create_cajero/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cajeros.create_cajero(@invalid_attrs)
    end

    test "update_cajero/2 with valid data updates the cajero" do
      cajero = cajero_fixture()
      update_attrs = %{apellidos: "some updated apellidos", fecha_ingreso: ~D[2023-03-08], horario_fin: 43, horario_inicio: 43, nombres: "some updated nombres"}

      assert {:ok, %Cajero{} = cajero} = Cajeros.update_cajero(cajero, update_attrs)
      assert cajero.apellidos == "some updated apellidos"
      assert cajero.fecha_ingreso == ~D[2023-03-08]
      assert cajero.horario_fin == 43
      assert cajero.horario_inicio == 43
      assert cajero.nombres == "some updated nombres"
    end

    test "update_cajero/2 with invalid data returns error changeset" do
      cajero = cajero_fixture()
      assert {:error, %Ecto.Changeset{}} = Cajeros.update_cajero(cajero, @invalid_attrs)
      assert cajero == Cajeros.get_cajero!(cajero.id)
    end

    test "delete_cajero/1 deletes the cajero" do
      cajero = cajero_fixture()
      assert {:ok, %Cajero{}} = Cajeros.delete_cajero(cajero)
      assert_raise Ecto.NoResultsError, fn -> Cajeros.get_cajero!(cajero.id) end
    end

    test "change_cajero/1 returns a cajero changeset" do
      cajero = cajero_fixture()
      assert %Ecto.Changeset{} = Cajeros.change_cajero(cajero)
    end
  end
end
