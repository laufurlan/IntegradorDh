import SecurityPolicy from "../product_detail_components/SecurityPolicy";
import { useState } from "react";
import TitleAndBackButton from "../product_detail_components/TitleAndBackButton";
import ReservationForm from "./ReservationForm";
import ReservationCard from "./ReservationCard";
import ModalSuccesReservation from "./ModalSuccesReservation";
import { useParams } from "react-router-dom";
import { useEffect } from "react";
import React from "react";
import {format} from 'date-fns'

const Reservation = ()=>{
  const [showSuccesModal, setShowSuccesModal] = useState(false);
  const [ showModalInvalid, setShowModaleInvalid ] = useState(false);
  const params = useParams();
  const [ productDetailInfo, setProductDetailInfo ] = useState({attributes:[],url_image:'',category_name:'',title:'',images:[]});
  const [ startAndEndDate, setStartAndEndDate ] = useState({start: null, end: null});
  const [ infoCardDate, setInfoCardDate] = useState({start: null, end: null});
  const setShowModalInvalid = () =>{
    setShowModaleInvalid(false);
  }

  const jwt = JSON.parse(sessionStorage.getItem("jwt"))
  useEffect(()=>{
    handleOnchangeCalendar(startAndEndDate.start, startAndEndDate.end);
  },[])

  const handleOnchangeCalendar = (start, end) =>{
    
    setStartAndEndDate({
      start: start != null ? format(new Date(start),"yyyy-MM-dd") : null,
      end: start != null ? format(new Date(end),"yyyy-MM-dd") : null
    })
    setInfoCardDate({
      start: start != null ? format(new Date(start),"dd/MM/yyyy") : null,
      end: start != null ? format(new Date(end),"dd/MM/yyyy") : null
    })
    
  }

  useEffect(()=>{
    fetch(`http://localhost:8080/products/${params.id}`)
      .then(res => res.json())
      .then(function(response) {     
          setProductDetailInfo(response);
      })
      .catch(function(error) {
        console.log('Hubo un problema con la petición Fetch:' + error.message);
      });
  },[params.id])

  const [miStatus, setMiStatus] = useState();


  const createBooking = ()=>{
         fetch("http://localhost:8080/bookings/reserveProduct", {
          method: "POST",
          body: JSON.stringify({
            "product_id": params.id,
            "initial_date": startAndEndDate.start,
            "final_date": startAndEndDate.end,
          }),
          headers: {
            Accept: "application/json",
          "Content-Type": "application/json",
            Authorization: `Bearer ${jwt}`
          },
        })
          .then((response) => setMiStatus(response.status));    
      };
      useEffect(() => {
          if (miStatus === 200) {
            setShowSuccesModal(true)
          }if (miStatus ===400){
            setShowModaleInvalid(true) }
     }, [miStatus])

  return(
    <div className="reservation-container">
      <TitleAndBackButton 
        category={productDetailInfo.category_name}
        name={productDetailInfo.title}
      />
      <div className="main-reservation">
        <ReservationForm 
          city={productDetailInfo.city_name}
          handleOnchangeCalendar={handleOnchangeCalendar}
          dateInfo={infoCardDate}
        />
        <ReservationCard 
          {...productDetailInfo}
          startAndEndDate={infoCardDate}
          onclick={createBooking}
        />
      </div>
      {
        showSuccesModal &&
          <ModalSuccesReservation
            succesMessage={"Su reserva se ha hecho con exito"} 
            thanks
            succes={1}
          />
      }
           {
        showModalInvalid &&
        <ModalSuccesReservation 
        onclick={setShowModalInvalid}
          succesMessage={"No se pudo realizar la reserva"}
          succes={3}
        />
      }
      <SecurityPolicy />
    </div>
  )
}

export default Reservation;