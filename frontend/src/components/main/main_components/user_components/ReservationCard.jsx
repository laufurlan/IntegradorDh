import { AiFillStar } from "react-icons/ai";
import { MdOutlineLocationOn } from "react-icons/md";
import React from "react";
import { useEffect, useState } from "react";

const ReservationCard = ({ showModalDelete, id, initial_date, final_date, cancelBooking, body }) =>{
  const [ infoProduct, setInfoProduct ] = useState({});
  useEffect(()=>{
    fetch(`http://localhost:8080/products/${id}`)
      .then(res => res.json())
      .then(function(response) { 
        setInfoProduct(response);
      })
      .catch(function(error) {
        console.log('Hubo un problema con la petición Fetch:' + error.message);
      });
  }, [])
  return(
    <div className="reservation-card">
      <h2>Detalle de reserva</h2>
      <div className="main-image-reservation">
        <img src={infoProduct.url_image} alt="" />
      </div>
      <div className="title-and-stars">
        <span>{infoProduct.category_name}</span>
        <h3>{infoProduct.title}</h3>
        <ul>
          <li><AiFillStar /></li>
          <li><AiFillStar /></li>
          <li><AiFillStar /></li>
          <li><AiFillStar /></li>
          <li><AiFillStar /></li>
        </ul>
      </div>
      <div className='product-location'>
        <MdOutlineLocationOn />
        <section className='location-info'>
          <p>{infoProduct.city_name}</p>
        </section>
      </div>
      <div className='underline'></div>
      <div className="check-in-check-out">
        <section>Check in</section>
        <section>
          {
            initial_date != null
            ? initial_date
            : "__/__/____"
          }
        </section>
      </div>
      <div className='underline'></div>
      <div className="check-in-check-out">
        <section>Check out</section>
        <section>
          {
            final_date != null
            ? final_date
            : "__/__/____"
          }
        </section>
      </div>
      <div className='underline'></div>
  
      <button onClick={()=>showModalDelete(id)}>Cancelar reserva</button>
    </div>
   ) 
}

export default ReservationCard;