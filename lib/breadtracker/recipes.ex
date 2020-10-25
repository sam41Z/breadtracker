defmodule Breadtracker.Recipes do
  @moduledoc """
  The Recipes context.
  """

  import Ecto.Query, warn: false
  alias Breadtracker.Repo

  alias Breadtracker.Recipes.Recipe

  @doc """
  Returns the list of recipes.

  ## Examples

      iex> list_recipes()
      [%Recipe{}, ...]

  """
  def list_recipes do
    Recipe
    |> Repo.all()
  end

  @doc """
  Gets a single recipe.

  Raises `Ecto.NoResultsError` if the Recipe does not exist.

  ## Examples

      iex> get_recipe!(123)
      %Recipe{}

      iex> get_recipe!(456)
      ** (Ecto.NoResultsError)

  """
  def get_recipe!(id) do
    Recipe
    |> Repo.get!(id)
  end



  @doc """
  Creates a recipe.

  ## Examples

      iex> create_recipe(%{field: value})
      {:ok, %Recipe{}}

      iex> create_recipe(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_recipe(attrs \\ %{}) do
    %Recipe{}
    |> Recipe.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a recipe.

  ## Examples

      iex> update_recipe(recipe, %{field: new_value})
      {:ok, %Recipe{}}

      iex> update_recipe(recipe, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_recipe(%Recipe{} = recipe, attrs) do
    recipe
    |> Recipe.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a recipe.

  ## Examples

      iex> delete_recipe(recipe)
      {:ok, %Recipe{}}

      iex> delete_recipe(recipe)
      {:error, %Ecto.Changeset{}}

  """
  def delete_recipe(%Recipe{} = recipe) do
    Repo.delete(recipe)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking recipe changes.

  ## Examples

      iex> change_recipe(recipe)
      %Ecto.Changeset{data: %Recipe{}}

  """
  def change_recipe(%Recipe{} = recipe, attrs \\ %{}) do
    Recipe.changeset(recipe, attrs)
  end

  alias Breadtracker.Recipes.RecipeIngredient

  @doc """
  Returns the list of recipe_ingredients.

  ## Examples

      iex> list_recipe_ingredients()
      [%RecipeIngredient{}, ...]

  """
  def list_recipe_ingredients(recipe) do
    Repo.all(from i in RecipeIngredient, where: i.recipe_id == ^recipe)
    |> Repo.preload(:ingredient)
  end

  @doc """
  Gets a single recipe_ingredient.

  Raises `Ecto.NoResultsError` if the Recipe ingredient does not exist.

  ## Examples

      iex> get_recipe_ingredient!(123)
      %RecipeIngredient{}

      iex> get_recipe_ingredient!(456)
      ** (Ecto.NoResultsError)

  """
  def get_recipe_ingredient!(id) do 
    Repo.get!(RecipeIngredient, id)
    |> Repo.preload(:ingredient)
  end

  @doc """
  Creates a recipe_ingredient.

  ## Examples

      iex> create_recipe_ingredient(%{field: value})
      {:ok, %RecipeIngredient{}}

      iex> create_recipe_ingredient(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_recipe_ingredient(recipe_id, attrs \\ %{}) do
    %RecipeIngredient{}
    |> RecipeIngredient.changeset(attrs)
    |> Ecto.Changeset.put_change(:recipe_id, recipe_id)
    |> Repo.insert()
  end

  @doc """
  Updates a recipe_ingredient.

  ## Examples

      iex> update_recipe_ingredient(recipe_ingredient, %{field: new_value})
      {:ok, %RecipeIngredient{}}

      iex> update_recipe_ingredient(recipe_ingredient, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_recipe_ingredient(%RecipeIngredient{} = recipe_ingredient, attrs) do
    recipe_ingredient
    |> RecipeIngredient.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a recipe_ingredient.

  ## Examples

      iex> delete_recipe_ingredient(recipe_ingredient)
      {:ok, %RecipeIngredient{}}

      iex> delete_recipe_ingredient(recipe_ingredient)
      {:error, %Ecto.Changeset{}}

  """
  def delete_recipe_ingredient(%RecipeIngredient{} = recipe_ingredient) do
    Repo.delete(recipe_ingredient)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking recipe_ingredient changes.

  ## Examples

      iex> change_recipe_ingredient(recipe_ingredient)
      %Ecto.Changeset{data: %RecipeIngredient{}}

  """
  def change_recipe_ingredient(%RecipeIngredient{} = recipe_ingredient, attrs \\ %{}) do
    RecipeIngredient.changeset(recipe_ingredient, attrs)
  end
end
