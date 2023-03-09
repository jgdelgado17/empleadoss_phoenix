defmodule EmpleadossPhoenix.Cajeros.Cajero do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "cajero" do
    field :apellidos, :string
    field :fecha_ingreso, :date
    field :horario_fin, :integer
    field :horario_inicio, :integer
    field :nombres, :string
    # field :supervisor_id, :binary_id
    belongs_to :supervisor, EmpleadossPhoenix.Supervisores.Supervisor

    timestamps()
  end

  @doc false
  def changeset(cajero, attrs) do
    cajero
    |> cast(attrs, [:nombres, :apellidos, :fecha_ingreso, :horario_inicio, :horario_fin, :supervisor_id])
    |> validate_required([:nombres, :apellidos, :fecha_ingreso, :horario_inicio, :horario_fin, :supervisor_id])
  end
end
