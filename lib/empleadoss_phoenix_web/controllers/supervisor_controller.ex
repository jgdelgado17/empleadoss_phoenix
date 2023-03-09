defmodule EmpleadossPhoenixWeb.SupervisorController do
  use EmpleadossPhoenixWeb, :controller

  alias EmpleadossPhoenix.Supervisores
  alias EmpleadossPhoenix.Supervisores.Supervisor

  action_fallback EmpleadossPhoenixWeb.FallbackController

  def index(conn, _params) do
    supervisor = Supervisores.list_supervisor()
    render(conn, :index, supervisor: supervisor)
  end

  def mascajeros(conn, _params) do
    supervisor = Supervisores.super_conmas_cajeros()
    render(conn, :index, supervisor: supervisor)
  end

  def pornombre(conn, %{"nombre" => nombre}) do
    supervisor = Supervisores.by_name(nombre)
    render(conn, :show, supervisor: supervisor)
  end

  def create(conn, %{"supervisor" => supervisor_params}) do
    with {:ok, %Supervisor{} = supervisor} <- Supervisores.create_supervisor(supervisor_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", ~p"/api/supervisor/#{supervisor}")
      |> render(:show, supervisor: supervisor)
    end
  end

  def show(conn, %{"id" => id}) do
    supervisor = Supervisores.get_supervisor!(id)
    render(conn, :show, supervisor: supervisor)
  end

  def update(conn, %{"id" => id, "supervisor" => supervisor_params}) do
    supervisor = Supervisores.get_supervisor!(id)

    with {:ok, %Supervisor{} = supervisor} <- Supervisores.update_supervisor(supervisor, supervisor_params) do
      render(conn, :show, supervisor: supervisor)
    end
  end

  def delete(conn, %{"id" => id}) do
    supervisor = Supervisores.get_supervisor!(id)

    with {:ok, %Supervisor{}} <- Supervisores.delete_supervisor(supervisor) do
      send_resp(conn, :no_content, "")
    end
  end
end
