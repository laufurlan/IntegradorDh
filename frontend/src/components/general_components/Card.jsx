import Imagen from "./imagen.png"
import React from 'react'

const Card = (props) =>{
  return(
    <div className="card-category">
      <section>
        <img src={Imagen} alt="" />
      </section>
      <article className="category-info">
        <h3>Hoteles</h3>
        <p><span>807.105</span>Hoteles</p>
      </article>

    </div>
  )
}

export default Card;
