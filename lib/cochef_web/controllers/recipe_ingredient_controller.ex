defmodule CoChefWeb.RecipeIngredientController do
  use CoChefWeb, :controller

  alias CoChef.Recipes
  alias CoChef.Recipes.RecipeIngredient

  action_fallback CoChefWeb.FallbackController

  def index(conn, %{"recipe_id" => recipe_id}) do
    recipe_ingredients = Recipes.list_recipe_ingredients(recipe_id)
    render(conn, "index.json", recipe_ingredients: recipe_ingredients)
  end

  def show(conn, %{"id" => id}) do
    recipe_ingredient = Recipes.get_recipe_ingredient!(id)
    render(conn, "show.json", recipe_ingredient: recipe_ingredient)
  end

  def create(conn, %{"recipe_id" => recipe_id, "recipe_ingredient" => recipe_ingredient_params}) do
    {recipe_id_int, _} = Integer.parse(recipe_id)

    with {:ok, %RecipeIngredient{} = recipe_ingredient} <-
           Recipes.create_recipe_ingredient(recipe_id_int, recipe_ingredient_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.recipe_path(conn, :show, recipe_ingredient))
      |> render("show.json", recipe_ingredient: recipe_ingredient)
    end
    
  end

  def update(conn, %{
        "id" => id,
        "recipe_ingredient" => recipe_ingredient_params
      }) do
    recipe_ingredient = Recipes.get_recipe_ingredient!(id)

    with {:ok, %RecipeIngredient{} = recipe_ingredient} <-
           Recipes.update_recipe_ingredient(recipe_ingredient, recipe_ingredient_params) do
      render(conn, "show.json", recipe_ingredient: recipe_ingredient)
    end
  end

  def delete(conn, %{"id" => id}) do
    recipe_ingredient = Recipes.get_recipe_ingredient!(id)

    with {:ok, %RecipeIngredient{}} <- Recipes.delete_recipe_ingredient(recipe_ingredient) do
      send_resp(conn, :no_content, "")
    end
  end
end
