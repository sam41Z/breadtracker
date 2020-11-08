import { post, get, deleteFetch, put } from "../api_request";
import { Ingredient } from "../ingredients/ingredients_api";

export interface Recipe {
  id: number;
  name: string;
  ingredients: RecipeIngredient[];
}

export interface RecipeNew {
  name: string;
}

export interface RecipeIngredient {
  id: number;
  amount: number;
  ingredient: Ingredient;
}

export interface RecipeIngredientNew {
  amount: number;
  ingredient_id: number;
}

export function postRecipe(recipe: RecipeNew) {
  return post("/api/recipes", { recipe: recipe });
}

export function putRecipe(recipe: Recipe) {
  return put("/api/recipes/" + recipe.id, { recipe: recipe });
}

export function saveRecipeIngredient(
  recipeId: number,
  recipeIngredient: RecipeIngredientNew
) {
  return post("/api/recipes/" + recipeId + "/ingredients", {
    recipe_ingredient: recipeIngredient,
  });
}

export function updateRecipeIngredient(
  recipeId: number,
  recipeIngredient: RecipeIngredient
) {
  return put(
    "/api/recipes/" + recipeId + "/ingredients/" + recipeIngredient.id,
    {
      recipe_ingredient: recipeIngredient,
    }
  );
}
export function deleteRecipeIngredient(recipeId: number, id: number) {
  return deleteFetch("/api/recipes/" + recipeId + "/ingredients/" + id);
}

export function getRecipes() {
  return get("/api/recipes");
}

export function getRecipeIngredients(id: number) {
  return get("/api/recipes/" + id + "/ingredients");
}

export function deleteRecipe(id: number) {
  return deleteFetch("/api/recipes/" + id);
}
