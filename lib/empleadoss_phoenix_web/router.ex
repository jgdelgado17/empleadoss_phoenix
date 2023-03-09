defmodule EmpleadossPhoenixWeb.Router do
  alias EmpleadossPhoenixWeb.CajeroController
  alias EmpleadossPhoenixWeb.SupervisorController
  alias EmpleadossPhoenixWeb.JefesucursalController
  use EmpleadossPhoenixWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/api", EmpleadossPhoenixWeb do
  scope "/api" do
    pipe_through :api
    resources "/jefesucursales", JefesucursalController, except: [:edit, :new, :update]
    put "/jefesucursales/id", JefesucursalController, :update
    resources "/supervisores", SupervisorController, except: [:edit, :new, :update]
    put "/supervisores/id", SupervisorController, :update
    get "/supervisor/mascajeros", SupervisorController, :mascajeros
    get "/supervisor/nombre/:nombre", SupervisorController, :pornombre
    resources "/cajeros", CajeroController, except: [:edit, :new, :update]
    put "/cajeros/id", CajeroController, :update
  end
end
