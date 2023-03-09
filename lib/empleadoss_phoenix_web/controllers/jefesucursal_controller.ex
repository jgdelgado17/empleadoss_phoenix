defmodule EmpleadossPhoenixWeb.JefesucursalController do
  use EmpleadossPhoenixWeb, :controller

  alias EmpleadossPhoenix.Jefesucursales
  alias EmpleadossPhoenix.Jefesucursales.Jefesucursal

  action_fallback EmpleadossPhoenixWeb.FallbackController

  def index(conn, _params) do
    jefesucursal = Jefesucursales.list_jefesucursal()
    render(conn, :index, jefesucursal: jefesucursal)
  end

  def create(conn, %{"jefesucursal" => jefesucursal_params}) do
    with {:ok, %Jefesucursal{} = jefesucursal} <- Jefesucursales.create_jefesucursal(jefesucursal_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", ~p"/api/jefesucursal/#{jefesucursal}")
      |> render(:show, jefesucursal: jefesucursal)
    end
  end

  def show(conn, %{"id" => id}) do
    jefesucursal = Jefesucursales.get_jefesucursal!(id)
    render(conn, :show, jefesucursal: jefesucursal)
  end

  def update(conn, %{"id" => id, "jefesucursal" => jefesucursal_params}) do
    jefesucursal = Jefesucursales.get_jefesucursal!(id)

    with {:ok, %Jefesucursal{} = jefesucursal} <- Jefesucursales.update_jefesucursal(jefesucursal, jefesucursal_params) do
      render(conn, :show, jefesucursal: jefesucursal)
    end
  end

  def delete(conn, %{"id" => id}) do
    jefesucursal = Jefesucursales.get_jefesucursal!(id)

    with {:ok, %Jefesucursal{}} <- Jefesucursales.delete_jefesucursal(jefesucursal) do
      send_resp(conn, :no_content, "")
    end
  end
end
