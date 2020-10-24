defmodule Breadtracker.Recipes.Recipe do
  use Ecto.Schema
  import Ecto.Changeset
  alias Breadtracker.Recipes.RecipeIngredient

  schema "recipes" do
    field :name, :string
    has_many :recipe_ingredients, RecipeIngredient

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> cast_assoc(:recipe_ingredients, required: true)
  end
end
