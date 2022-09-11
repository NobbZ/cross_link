defmodule CrossLink.Person do
  use Ecto.Schema

  alias Ecto.Changeset

  schema "people" do
    field :first_name, :string
    field :last_name, :string
    field :age, :string
  end

  def changeset(person, params \\ %{})
  def changeset(person, params) when is_list(params), do: changeset(person, Map.new(params))

  def changeset(person, params) when is_map(params) do
    person
    |> Changeset.cast(params, ~w[first_name last_name age]a)
    |> Changeset.validate_required(~w[first_name last_name]a)
  end
end
