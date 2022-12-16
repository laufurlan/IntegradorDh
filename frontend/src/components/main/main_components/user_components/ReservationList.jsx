import React from "react";
import ReservationCard from "./ReservationCard";
import { useEffect, useState } from "react";
import Error from "../../../Error";
import Product from "./Product";
import ModalSuccesReservation from "../reservation_components/ModalSuccesReservation";


const ReservationList = () =>{
  
  const jwt = JSON.parse(sessionStorage.getItem("jwt"));
  const user = JSON.parse(sessionStorage.getItem("user"));
  const [ showErrorMessage, setShowErrorMessage ] = useState(false);
  const [ miStatus, setMiStatus ] = useState(null);
  const [ refresh, setRefresh] = useState(false);
  const [ reservationProducts, setReservationProducts ] = useState([]);
  const [ showModalDelete, setShowModalDelete ] = useState(false);

  const setShowModalDeleteFalse = () =>{
    setShowModalDelete(false);
  }
  const setShowModalDeletetrue = (id) =>{
    setShowModalDelete(id);
  }

  const cancelBookingOrDeleteProduct = (obj, id) =>{
    if(id === null){
      fetch(`http://localhost:8080/bookings/cancelBooking`,{
        method:'DELETE',
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
          Authorization: `Bearer ${jwt}`
        },
        body: JSON.stringify(obj),
      })
      .then((response) => setMiStatus(response.status)); 
    }
    if(obj === null){
      fetch(`http://localhost:8080/products/${id}`,{
        method:'DELETE',
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
          Authorization: `Bearer ${jwt}`
        }
      })
      .then((response) => setMiStatus(response.status)); 
    }

    
  };

  useEffect(() => {
    if (miStatus === 200){
      setRefresh(true);
    }
    if (miStatus ===400){
      setShowErrorMessage(true);
    }
    return setMiStatus(null);
 }, [miStatus])

  useEffect(()=>{
    const url = 
      (user.authorities === "ROLE_offerer" && "http://localhost:8080/products/myProducts") 
      || (user.authorities === "ROLE_client" && "http://localhost:8080/bookings/byUser");
    
      fetch(`${url}`,
      {
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
          Authorization: `Bearer ${jwt}`
        }})
        .then(res => res.json())
        .then(function(response) { 
          setReservationProducts(response);
        })
        .catch(function(error) {  
          console.log('Hubo un problema con la petición Fetch:' + error.message);
          setShowErrorMessage(true);
          setReservationProducts(false)
      });
      return setRefresh(false);
    
  }, [refresh])

  return (
    <div className={`container-list ${showErrorMessage && "contain"}`}>
      {
        user.authorities === "ROLE_client" &&
          reservationProducts &&
            reservationProducts.map((reservationProduct) =>{
              return <ReservationCard 
                key={reservationProduct.product_id}
                id={reservationProduct.product_id}
                initial_date={reservationProduct.initial_date}
                final_date={reservationProduct.final_date}
                body={reservationProduct}
                cancelBooking={cancelBookingOrDeleteProduct}
                showModalDelete={setShowModalDeletetrue}
              />
            })
      }
      {
        user.authorities === "ROLE_offerer" &&
          reservationProducts &&
            <Product
                key={(reservationProducts.length + 1)}
                createProduct
            />
      }
      {
        user.authorities === "ROLE_offerer" &&
          reservationProducts &&
            reservationProducts.map((reservationProduct) =>{
              return <Product
              key={reservationProduct.id}
              p={reservationProduct}
              showModalDelete={setShowModalDeletetrue}
            />
            })            
      }
      {
        user.authorities === "ROLE_client" 
        ? showErrorMessage &&
          <Error error={400} message={"No encontramos reservaciones tuyas"}/> 
        : showErrorMessage &&
          <Error createProduct/> 
      }
      { reservationProducts &&
          showModalDelete &&
          reservationProducts.map((reservationProduct) =>{
            if(reservationProduct.id === showModalDelete){
              return <ModalSuccesReservation
                succesMessage={"¿Esta seguro de eliminar este producto?"}
                onclick={cancelBookingOrDeleteProduct}
                id={{obj:null, id:reservationProduct.id}}
                setModalFalse={setShowModalDeleteFalse}
                deleteAction
                succes={2}
              />
            }
            if(reservationProduct.product_id === showModalDelete){
              return <ModalSuccesReservation
                succesMessage={"¿Esta seguro de eliminar esta reservacion?"}
                onclick={cancelBookingOrDeleteProduct}
                id={{obj:reservationProduct, id:null}}
                setModalFalse={setShowModalDeleteFalse}
                deleteAction
                succes={2}
              />
            }
           
        })
      }
        
    </div>
  )
}

export default ReservationList;