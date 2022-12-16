import React from "react";

const CardCategories = ({ c, onclick }) => {
return (
    <button className="card-category" onClick={()=>onclick(c.id, c.title)}>
        <div>
            <section>
                <img src={c.url_image} alt="" />
            </section>
            <article className="category-info">
                <h3>{c.title}</h3>
                <p><span>{c.quantity} </span>{c.title}</p>
            </article>
        </div>
    </button>
  );
}

export default CardCategories;