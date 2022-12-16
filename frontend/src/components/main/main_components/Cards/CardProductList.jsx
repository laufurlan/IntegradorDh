import React from "react";
import CardProduct from "./CardProduct";

const CardProductList = ({ prod, title }) =>{
  return(
    <article className="section-recomendation">
      <h2>{title}</h2> 
      <div className="container-card">
        {prod.map(p => {
          return <CardProduct key={p.id} p={p}/>
        })}
      </div>
    </article>
  );
}

export default CardProductList;
