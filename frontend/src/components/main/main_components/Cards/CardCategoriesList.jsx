import CardCategories from './CardCategories';
import React from 'react';

const CardCategoriesList = ({ cat, onclick }) =>{
  return(
    <div className="category">
      <h2>Buscar por tipo de alojamiento</h2>
      <div className="card-container">
        {cat.map(c => {
           return <CardCategories key={c.id} c={c} onclick={onclick}/>
        })}
      </div>
    </div>
  );
}

export default CardCategoriesList;
