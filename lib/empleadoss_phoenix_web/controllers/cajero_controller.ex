defmodule EmpleadossPhoenixWeb.CajeroController do
  use EmpleadossPhoenixWeb, :controller

  alias EmpleadossPhoenix.Cajeros
  alias EmpleadossPhoenix.Cajeros.Cajero

  action_fallback EmpleadossPhoenixWeb.FallbackController

  def index(conn, _params) do
    cajero = Cajeros.list_cajero()
    render(conn, :index, cajero: cajero)
  end

  def create(conn, %{"cajero" => cajero_params}) do
    with {:ok, %Cajero{} = cajero} <- Cajeros.create_cajero(cajero_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", ~p"/api/cajero/#{cajero}")
      |> render(:show, cajero: cajero)
    end
  end

  def show(conn, %{"id" => id}) do
    cajero = Cajeros.get_cajero!(id)
    render(conn, :show, cajero: cajero)
  end

  def update(conn, %{"id" => id, "cajero" => cajero_params}) do
    cajero = Cajeros.get_cajero!(id)

    with {:ok, %Cajero{} = cajero} <- Cajeros.update_cajero(cajero, cajero_params) do
      render(conn, :show, cajero: cajero)
    end
  end

  def delete(conn, %{"id" => id}) do
    cajero = Cajeros.get_cajero!(id)

    with {:ok, %Cajero{}} <- Cajeros.delete_cajero(cajero) do
      send_resp(conn, :no_content, "")
    end
  end
end
