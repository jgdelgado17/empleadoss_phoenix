defmodule EmpleadossPhoenix.SupervisoresTest do
  use EmpleadossPhoenix.DataCase

  alias EmpleadossPhoenix.Supervisores

  describe "supervisor" do
    alias EmpleadossPhoenix.Supervisores.Supervisor

    import EmpleadossPhoenix.SupervisoresFixtures

    @invalid_attrs %{apellidos: nil, fecha_ingreso: nil, nombres: nil}

    test "list_supervisor/0 returns all supervisor" do
      supervisor = supervisor_fixture()
      assert Supervisores.list_supervisor() == [supervisor]
    end

    test "get_supervisor!/1 returns the supervisor with given id" do
      supervisor = supervisor_fixture()
      assert Supervisores.get_supervisor!(supervisor.id) == supervisor
    end

    test "create_supervisor/1 with valid data creates a supervisor" do
      valid_attrs = %{apellidos: "some apellidos", fecha_ingreso: ~D[2023-03-07], nombres: "some nombres"}

      assert {:ok, %Supervisor{} = supervisor} = Supervisores.create_supervisor(valid_attrs)
      assert supervisor.apellidos == "some apellidos"
      assert supervisor.fecha_ingreso == ~D[2023-03-07]
      assert supervisor.nombres == "some nombres"
    end

    test "create_supervisor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Supervisores.create_supervisor(@invalid_attrs)
    end

    test "update_supervisor/2 with valid data updates the supervisor" do
      supervisor = supervisor_fixture()
      update_attrs = %{apellidos: "some updated apellidos", fecha_ingreso: ~D[2023-03-08], nombres: "some updated nombres"}

      assert {:ok, %Supervisor{} = supervisor} = Supervisores.update_supervisor(supervisor, update_attrs)
      assert supervisor.apellidos == "some updated apellidos"
      assert supervisor.fecha_ingreso == ~D[2023-03-08]
      assert supervisor.nombres == "some updated nombres"
    end

    test "update_supervisor/2 with invalid data returns error changeset" do
      supervisor = supervisor_fixture()
      assert {:error, %Ecto.Changeset{}} = Supervisores.update_supervisor(supervisor, @invalid_attrs)
      assert supervisor == Supervisores.get_supervisor!(supervisor.id)
    end

    test "delete_supervisor/1 deletes the supervisor" do
      supervisor = supervisor_fixture()
      assert {:ok, %Supervisor{}} = Supervisores.delete_supervisor(supervisor)
      assert_raise Ecto.NoResultsError, fn -> Supervisores.get_supervisor!(supervisor.id) end
    end

    test "change_supervisor/1 returns a supervisor changeset" do
      supervisor = supervisor_fixture()
      assert %Ecto.Changeset{} = Supervisores.change_supervisor(supervisor)
    end
  end
end
