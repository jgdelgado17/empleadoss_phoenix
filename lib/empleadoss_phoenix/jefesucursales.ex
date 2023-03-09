defmodule EmpleadossPhoenix.Jefesucursales do
  @moduledoc """
  The Jefesucursales context.
  """

  import Ecto.Query, warn: false
  alias EmpleadossPhoenix.Repo

  alias EmpleadossPhoenix.Jefesucursales.Jefesucursal

  @doc """
  Returns the list of jefesucursal.

  ## Examples

      iex> list_jefesucursal()
      [%Jefesucursal{}, ...]

  """
  def list_jefesucursal do
    Repo.all(Jefesucursal) |> Repo.preload(:supervisor)
  end

  @doc """
  Gets a single jefesucursal.

  Raises `Ecto.NoResultsError` if the Jefesucursal does not exist.

  ## Examples

      iex> get_jefesucursal!(123)
      %Jefesucursal{}

      iex> get_jefesucursal!(456)
      ** (Ecto.NoResultsError)

  """
  def get_jefesucursal!(id), do: Repo.get!(Jefesucursal, id) |> Repo.preload(:supervisor)

  @doc """
  Creates a jefesucursal.

  ## Examples

      iex> create_jefesucursal(%{field: value})
      {:ok, %Jefesucursal{}}

      iex> create_jefesucursal(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_jefesucursal(attrs \\ %{}) do
    %Jefesucursal{}
    |> Jefesucursal.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a jefesucursal.

  ## Examples

      iex> update_jefesucursal(jefesucursal, %{field: new_value})
      {:ok, %Jefesucursal{}}

      iex> update_jefesucursal(jefesucursal, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_jefesucursal(%Jefesucursal{} = jefesucursal, attrs) do
    jefesucursal
    |> Jefesucursal.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a jefesucursal.

  ## Examples

      iex> delete_jefesucursal(jefesucursal)
      {:ok, %Jefesucursal{}}

      iex> delete_jefesucursal(jefesucursal)
      {:error, %Ecto.Changeset{}}

  """
  def delete_jefesucursal(%Jefesucursal{} = jefesucursal) do
    Repo.delete(jefesucursal)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking jefesucursal changes.

  ## Examples

      iex> change_jefesucursal(jefesucursal)
      %Ecto.Changeset{data: %Jefesucursal{}}

  """
  def change_jefesucursal(%Jefesucursal{} = jefesucursal, attrs \\ %{}) do
    Jefesucursal.changeset(jefesucursal, attrs)
  end
end
