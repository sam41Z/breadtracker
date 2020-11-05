import React, { useState, useEffect } from "react";
import { Recipe, getRecipes, deleteRecipe } from "./recipes_api";
import NamedItem from "../named_item";
import RecipeForm from "./recipe_form";

const Recipes = () => {
  const [recipes, setRecipes] = useState<Recipe[]>([]);
  const fetchRecipes = () => {
    getRecipes()
      .then((response: Recipe[]) => {
        setRecipes(response);
      })
      .catch((error) => console.log(error));
  };
  useEffect(() => {
    fetchRecipes();
  }, []);

  const onClickDelete = (id: number) => {
    deleteRecipe(id)
      .then(() => fetchRecipes())
      .catch((error) => console.log(error));
  };

  const items = recipes.map((recipe) => (
    <NamedItem
      key={recipe.id}
      id={recipe.id}
      name={recipe.name}
      onClickDelete={onClickDelete}
    />
  ));
  return (
    <div>
      <div>{items}</div>
      <RecipeForm onDone={fetchRecipes} />
    </div>
  );
};

export default Recipes;
