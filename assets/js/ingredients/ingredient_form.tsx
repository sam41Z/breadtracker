import React, { useState, SyntheticEvent } from "react";
import { IngredientNew, Ingredient } from "./ingredients_api";
import { postIngredient } from "./ingredients_api";

const IngredientForm = (props: {
  onSave: (ingredient: Ingredient) => void;
}) => {
  const [name, setName] = useState("");
  const [energy, setEneregy] = useState(0);
  const [fat, setFat] = useState(0);
  const [carbohydrates, setCarbohydartes] = useState(0);
  const [fiber, setFiber] = useState(0);
  const [protein, setProtein] = useState(0);

  const handleSubmit = (event: SyntheticEvent) => {
    event.preventDefault();
    saveIngredient({
      name: name,
      energy: energy,
      fat: fat,
      carbohydrates: carbohydrates,
      fiber: fiber,
      protein: protein,
      type: "flour",
    });
  };
  const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    switch (event.target.name) {
      case "name":
        setName(event.target.value);
        break;
      case "energy":
        setEneregy(Number(event.target.value));
        break;
      case "fat":
        setFat(Number(event.target.value));
        break;
      case "carbohydrates":
        setCarbohydartes(Number(event.target.value));
        break;
      case "fiber":
        setFiber(Number(event.target.value));
        break;
      case "protein":
        setProtein(Number(event.target.value));
    }
  };
  const saveIngredient = (ingredient: IngredientNew) => {
    postIngredient(ingredient)
      .then((response: Ingredient) => {
        props.onSave(response);
        setName("");
        setEneregy(0);
        setFat(0);
        setCarbohydartes(0);
        setFiber(0);
        setProtein(0);
      })
      .catch((error: any) => console.log(error));
  };
  return (
    <form className="ingredient-form" onSubmit={handleSubmit}>
      <label>Name:</label>
      <input type="text" name="name" value={name} onChange={handleChange} />
      <label>Energy (kj):</label>
      <input
        type="number"
        name="energy"
        value={energy}
        onChange={handleChange}
      />
      <label> Fat (g):</label>
      <input type="number" name="fat" value={fat} onChange={handleChange} />
      <label>Carbohydrates (g):</label>
      <input
        type="number"
        name="carbohydrates"
        value={carbohydrates}
        onChange={handleChange}
      />
      <label>Fiber (g):</label>
      <input type="number" name="fiber" value={fiber} onChange={handleChange} />
      <label>Protein (g):</label>
      <input
        type="number"
        name="protein"
        value={protein}
        onChange={handleChange}
      />
      <input type="submit" value="Add" />
    </form>
  );
};

export default IngredientForm;
