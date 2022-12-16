import React from 'react'
import Card from "../../general_components/Card";

const Categorias = () =>{
  const categorias = [
    { id: '1', category: 'Hoteles', result: 100000 },
    { id: '2', category: 'Hostels', result: 2500 },
    { id: '3', category: 'Departamentos', result: 36000 },
    { id: '4', category: 'Bed and Breakfast', result: 400 }
  ]
  return(
    <div className="category">
      <h2>Buscar por tipo de alojamiento</h2>
      <div className="card-container">
        {categorias.map((category)=> (
          <Card  props={category}/>
        ))}
      </div>
    </div>
  )
}

export default Categorias;
