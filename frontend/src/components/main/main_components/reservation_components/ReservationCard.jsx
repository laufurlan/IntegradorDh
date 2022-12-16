import { AiFillStar } from "react-icons/ai";
import { MdOutlineLocationOn } from "react-icons/md";
import React from "react";

const ReservationCard = ({ onclick,  url_image, category_name , title, city_name, startAndEndDate}) =>{
 return(
  <div className="reservation-card">
    <h2>Detalle de reserva</h2>
    <div className="main-image-reservation">
      <img src={url_image} alt="" />
    </div>
    <div className="title-and-stars">
      <span>{category_name}</span>
      <h3>{title}</h3>
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
        <p>{city_name}</p>
      </section>
    </div>
    <div className='underline'></div>
    <div className="check-in-check-out">
      <section>Check in</section>
      <section>
        {
          startAndEndDate.start !== "31/12/1969"
          ? startAndEndDate.start
          : "__/__/____"
        }
      </section>
    </div>
    <div className='underline'></div>
    <div className="check-in-check-out">
      <section>Check out</section>
      <section>
        {
          startAndEndDate.end !== "31/12/1969"
          ? startAndEndDate.end
          : "__/__/____"
        }
      </section>
    </div>
    <div className='underline'></div>

    <button onClick={onclick}>Confirmar reserva</button>
  </div>
 ) 
}

export default ReservationCard;