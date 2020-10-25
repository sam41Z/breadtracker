defmodule Breadtracker.Recipes.RecipeIngredient do
  use Ecto.Schema
  import Ecto.Changeset

  alias Breadtracker.Recipes.Recipe
  alias Breadtracker.Ingredients.Ingredient

  schema "recipe_ingredients" do
    field :amount, :float
    belongs_to :recipe, Recipe
    belongs_to :ingredient, Ingredient

    timestamps()
  end

  @doc false
  def changeset(recipe_ingredient, attrs) do
    recipe_ingredient
    |> cast(attrs, [:amount])
    |> validate_required([:amount])
  end
end