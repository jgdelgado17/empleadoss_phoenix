defmodule EmpleadossPhoenixWeb.SupervisorControllerTest do
  use EmpleadossPhoenixWeb.ConnCase

  import EmpleadossPhoenix.SupervisoresFixtures

  alias EmpleadossPhoenix.Supervisores.Supervisor

  @create_attrs %{
    apellidos: "some apellidos",
    fecha_ingreso: ~D[2023-03-07],
    nombres: "some nombres"
  }
  @update_attrs %{
    apellidos: "some updated apellidos",
    fecha_ingreso: ~D[2023-03-08],
    nombres: "some updated nombres"
  }
  @invalid_attrs %{apellidos: nil, fecha_ingreso: nil, nombres: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all supervisor", %{conn: conn} do
      conn = get(conn, ~p"/api/supervisor")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create supervisor" do
    test "renders supervisor when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/supervisor", supervisor: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/supervisor/#{id}")

      assert %{
               "id" => ^id,
               "apellidos" => "some apellidos",
               "fecha_ingreso" => "2023-03-07",
               "nombres" => "some nombres"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/supervisor", supervisor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update supervisor" do
    setup [:create_supervisor]

    test "renders supervisor when data is valid", %{conn: conn, supervisor: %Supervisor{id: id} = supervisor} do
      conn = put(conn, ~p"/api/supervisor/#{supervisor}", supervisor: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/supervisor/#{id}")

      assert %{
               "id" => ^id,
               "apellidos" => "some updated apellidos",
               "fecha_ingreso" => "2023-03-08",
               "nombres" => "some updated nombres"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, supervisor: supervisor} do
      conn = put(conn, ~p"/api/supervisor/#{supervisor}", supervisor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete supervisor" do
    setup [:create_supervisor]

    test "deletes chosen supervisor", %{conn: conn, supervisor: supervisor} do
      conn = delete(conn, ~p"/api/supervisor/#{supervisor}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/supervisor/#{supervisor}")
      end
    end
  end

  defp create_supervisor(_) do
    supervisor = supervisor_fixture()
    %{supervisor: supervisor}
  end
end
