import TitleAndBackButton from "../product_detail_components/TitleAndBackButton";
import NewPropertyForm from "./NewPropertyForm";
import React from "react";
import ModalSuccesReservation from "../reservation_components/ModalSuccesReservation";
import {  useState } from "react";


const AddProduct = () =>{
  const [showSuccesModal, setShowSuccesModal] = useState(false);

  const handleOpenModal = () =>{
    setShowSuccesModal(true)
  }
  const handleCloseModal = () =>{
    setShowSuccesModal(false)
  }
  return(
    <div className="container">
      <TitleAndBackButton name={"Mis productos"} category={"Administracion"} />
      <NewPropertyForm onclick={handleOpenModal} />
      {
        showSuccesModal &&
          <ModalSuccesReservation 
            onclick={handleCloseModal} 
            succesMessage={"Tu propiedad se ha creado con éxito."}
          />
      }
    </div>
  )
}
export default AddProduct;