import React from "react";
import { MdOutlineLocationOn } from "react-icons/md";
import { BsCardImage } from "react-icons/bs";
import { useNavigate } from "react-router-dom";

const Product = ({ showModalDelete, p, createProduct }) =>{

  const navegate = useNavigate();
 

  return(
    <div className={createProduct ? "create-product" : "reservation-card" }>
      {
        createProduct 
          ? <h2>Crear producto</h2> 
          : <h2>Detalle del producto</h2>
      }
      <div className="main-image-reservation">
      {
        createProduct 
          ? <div className="img">
              <BsCardImage />
            </div> 
          : <img src={p.url_image} alt="" />
      }
      </div>
      <div className="title-and-stars">
        {
          createProduct 
            ? <div className="categor1"></div> 
            : <span>{p.category_name}</span>
        }
        {
          createProduct 
            ? <div className="title"></div> 
            : <h3>{p.title}</h3>
        }
      </div>
      <div className='product-location'>
        <MdOutlineLocationOn />
        <section className='location-info'>
        {
          createProduct 
            ? <div className="city-name"></div> 
            : <p>{p.city_name}</p>
        }
        </section>
      </div>
      <div className='underline'></div>
      
      <div className="description">
        {
          createProduct 
            ? <div className="descrip">
                <div className="p"></div>
                <div className="p"></div>
              </div> 
            : <p>
                {p.description}
                <strong>más...</strong>
              </p>
        }
      </div>
      <div className='underline'></div>
  
      {
        createProduct 
          ? <button onClick={()=>navegate("/create-product/")}>Crear producto +</button>
          : <section className="buttons">
              <button 
                className="secundary"
                onClick={()=>navegate(`/product-detail/${p.id}`)}
              >Ver detalles</button>
              <button onClick={()=>showModalDelete(p.id)}>Eliminar producto</button>
            </section>
      }

      
    </div>
   
  )
}
export default Product;