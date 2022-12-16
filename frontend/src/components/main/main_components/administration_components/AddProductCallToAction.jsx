import { MdOutlineAddBusiness } from "react-icons/md";
import { BsPlus } from "react-icons/bs";
import React from "react";
import { Link } from "react-router-dom";


const AddProductCallToAction = () =>{
  return(
    <div className="add-product-call-to-action">
      <MdOutlineAddBusiness />
      <h4>No encontramos productos</h4>
      <section>
        <Link to="/">Ir a pagina principal</Link>
        <Link 
          to="/create-product/"
          className="call-to-action"
        >
          <BsPlus />
          Crear produto
        </Link>
      </section>
    </div>
  )
}

export default AddProductCallToAction;