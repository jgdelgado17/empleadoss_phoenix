defmodule EmpleadossPhoenixWeb.CajeroControllerTest do
  use EmpleadossPhoenixWeb.ConnCase

  import EmpleadossPhoenix.CajerosFixtures

  alias EmpleadossPhoenix.Cajeros.Cajero

  @create_attrs %{
    apellidos: "some apellidos",
    fecha_ingreso: ~D[2023-03-07],
    horario_fin: 42,
    horario_inicio: 42,
    nombres: "some nombres"
  }
  @update_attrs %{
    apellidos: "some updated apellidos",
    fecha_ingreso: ~D[2023-03-08],
    horario_fin: 43,
    horario_inicio: 43,
    nombres: "some updated nombres"
  }
  @invalid_attrs %{apellidos: nil, fecha_ingreso: nil, horario_fin: nil, horario_inicio: nil, nombres: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all cajero", %{conn: conn} do
      conn = get(conn, ~p"/api/cajero")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create cajero" do
    test "renders cajero when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/cajero", cajero: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/cajero/#{id}")

      assert %{
               "id" => ^id,
               "apellidos" => "some apellidos",
               "fecha_ingreso" => "2023-03-07",
               "horario_fin" => 42,
               "horario_inicio" => 42,
               "nombres" => "some nombres"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/cajero", cajero: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update cajero" do
    setup [:create_cajero]

    test "renders cajero when data is valid", %{conn: conn, cajero: %Cajero{id: id} = cajero} do
      conn = put(conn, ~p"/api/cajero/#{cajero}", cajero: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/cajero/#{id}")

      assert %{
               "id" => ^id,
               "apellidos" => "some updated apellidos",
               "fecha_ingreso" => "2023-03-08",
               "horario_fin" => 43,
               "horario_inicio" => 43,
               "nombres" => "some updated nombres"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, cajero: cajero} do
      conn = put(conn, ~p"/api/cajero/#{cajero}", cajero: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete cajero" do
    setup [:create_cajero]

    test "deletes chosen cajero", %{conn: conn, cajero: cajero} do
      conn = delete(conn, ~p"/api/cajero/#{cajero}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/cajero/#{cajero}")
      end
    end
  end

  defp create_cajero(_) do
    cajero = cajero_fixture()
    %{cajero: cajero}
  end
end
