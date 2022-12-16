import React from "react";
import TitleAndBackButton from "../product_detail_components/TitleAndBackButton";
import ReservationList from "./ReservationList";


const ReservationMade = ({ name, category}) =>{
  return(
    <div className="reservation-contain">
      <TitleAndBackButton name={name} category={category}/>
      <ReservationList />
    </div>
  )
}

export default ReservationMade;