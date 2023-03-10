defmodule EmpleadossPhoenix.Supervisores do
  @moduledoc """
  The Supervisores context.
  """

  import Ecto.Query, warn: false
  alias EmpleadossPhoenix.Repo

  alias EmpleadossPhoenix.Supervisores.Supervisor

  @doc """
  Returns the list of supervisor.

  ## Examples

      iex> list_supervisor()
      [%Supervisor{}, ...]

  """
  def list_supervisor() do
    Repo.all(Supervisor) |> Repo.preload(:jefesucursal) |> Repo.preload(:cajero)
  end

  @doc """
  Gets a single supervisor.

  Raises `Ecto.NoResultsError` if the Supervisor does not exist.

  ## Examples

      iex> get_supervisor!(123)
      %Supervisor{}

      iex> get_supervisor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_supervisor!(id),
    do: Repo.get!(Supervisor, id) |> Repo.preload(:jefesucursal) |> Repo.preload(:cajero)

  @doc """
  Creates a supervisor.

  ## Examples

      iex> create_supervisor(%{field: value})
      {:ok, %Supervisor{}}

      iex> create_supervisor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_supervisor(attrs \\ %{}) do
    %Supervisor{}
    |> Supervisor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a supervisor.

  ## Examples

      iex> update_supervisor(supervisor, %{field: new_value})
      {:ok, %Supervisor{}}

      iex> update_supervisor(supervisor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_supervisor(%Supervisor{} = supervisor, attrs) do
    supervisor
    |> Supervisor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a supervisor.

  ## Examples

      iex> delete_supervisor(supervisor)
      {:ok, %Supervisor{}}

      iex> delete_supervisor(supervisor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_supervisor(%Supervisor{} = supervisor) do
    Repo.delete(supervisor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking supervisor changes.

  ## Examples

      iex> change_supervisor(supervisor)
      %Ecto.Changeset{data: %Supervisor{}}

  """
  def change_supervisor(%Supervisor{} = supervisor, attrs \\ %{}) do
    Supervisor.changeset(supervisor, attrs)
  end

  def super_conmas_cajeros do
    query =
      from s in Supervisor,
        join: c in assoc(s, :cajero),
        group_by: s.id,
        select: %{supervisor: s, cajeros_count: count(c.id)},
        limit: 1

    Repo.all(query)
  end

  def find_by_name(nombre) do
    from(s in Supervisor, where: s.nombres == ^nombre)
    |> Repo.all()
    |> Repo.preload([:jefesucursal, :cajero])
  end
end
