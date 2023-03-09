defmodule EmpleadossPhoenixWeb.JefesucursalControllerTest do
  use EmpleadossPhoenixWeb.ConnCase

  import EmpleadossPhoenix.JefesucursalesFixtures

  alias EmpleadossPhoenix.Jefesucursales.Jefesucursal

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
    test "lists all jefesucursal", %{conn: conn} do
      conn = get(conn, ~p"/api/jefesucursal")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create jefesucursal" do
    test "renders jefesucursal when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/jefesucursal", jefesucursal: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/jefesucursal/#{id}")

      assert %{
               "id" => ^id,
               "apellidos" => "some apellidos",
               "fecha_ingreso" => "2023-03-07",
               "nombres" => "some nombres"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/jefesucursal", jefesucursal: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update jefesucursal" do
    setup [:create_jefesucursal]

    test "renders jefesucursal when data is valid", %{conn: conn, jefesucursal: %Jefesucursal{id: id} = jefesucursal} do
      conn = put(conn, ~p"/api/jefesucursal/#{jefesucursal}", jefesucursal: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/jefesucursal/#{id}")

      assert %{
               "id" => ^id,
               "apellidos" => "some updated apellidos",
               "fecha_ingreso" => "2023-03-08",
               "nombres" => "some updated nombres"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, jefesucursal: jefesucursal} do
      conn = put(conn, ~p"/api/jefesucursal/#{jefesucursal}", jefesucursal: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete jefesucursal" do
    setup [:create_jefesucursal]

    test "deletes chosen jefesucursal", %{conn: conn, jefesucursal: jefesucursal} do
      conn = delete(conn, ~p"/api/jefesucursal/#{jefesucursal}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/jefesucursal/#{jefesucursal}")
      end
    end
  end

  defp create_jefesucursal(_) do
    jefesucursal = jefesucursal_fixture()
    %{jefesucursal: jefesucursal}
  end
end
