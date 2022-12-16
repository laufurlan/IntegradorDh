import React from "react";
import { BsCalendar2Week } from 'react-icons/bs';
import { TbError404 } from 'react-icons/tb';
import AddProductCallToAction from "./main/main_components/administration_components/AddProductCallToAction";
import { Link } from "react-router-dom";
import messi from "./img/messi.png"


const Error = ({error, message, createProduct}) =>{
  return(
    <div className="error-page">
      {
        createProduct 
        ? <AddProductCallToAction />
        : <div className="message">
            {
              error === 404 &&
              <TbError404 /> 
      
              
            }
                  {
              error === 404 &&
 <img src={messi} alt="messi" />
              
            }
            {
              error === 400 &&
              <BsCalendar2Week />
            }
            <p>{message}</p>
            <Link to="/">Ir a pagina principal</Link>
          </div>
      }
      
    </div>
  )
}

export default Error;