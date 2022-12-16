import { useAuthContext } from "../../../context/AuthContext";
import { useNavigate, useParams } from "react-router-dom";
import { useState, useEffect } from "react";
import React from "react";
import { format } from "date-fns/esm";

const BookButton = ({ productid, startAndEndDate }) => {
  const navegate = useNavigate();
  const [dateInfo, setDateInfo] = useState(null);
  const {getUser} = useAuthContext();
  const user = getUser();

  const handleSubmit = () => {
    const params = useParams
        if(!user){
            window.localStorage.setItem("path", `/product-detail/${params.id}` );
          return navegate ("/login");
        }
        navegate(`/booking-form/${productid}`);
  };

  useEffect(()=>{
    setDateInfo(startAndEndDate);
    sessionStorage.setItem("infoDate", JSON.stringify(startAndEndDate));
  }, [startAndEndDate.end])

 return(
    <div className='book-button'>
      { 
        (startAndEndDate.end != null) ?
          <h4> Las fechas se encunetran disponibles</h4>
          :<h4> Agregá tus fechas de viaje para obtener precios exactos </h4>
      }
      
      {
        (startAndEndDate.end != null) &&
        <div>
          <span>
            <h5>Check in</h5>
            {format(new Date(dateInfo.start),"dd/MM/yyyy")}
          </span>
          <span className="checkout">
          
            <h5>Check out</h5>
            {format(new Date(dateInfo.end),"dd/MM/yyyy")}  
          </span>
        </div>
      }
      <button type="submit" onClick={handleSubmit}> Iniciar reserva </button>
    </div>
  )
}

export default BookButton;
