import { HiBadgeCheck } from 'react-icons/hi';
import { BsFillPatchQuestionFill, BsPatchExclamationFill} from 'react-icons/bs';

import React from "react";
import { Link } from "react-router-dom";

const ModalSuccesReservation = ({ succes, succesMessage, onclick, thanks, deleteAction , id, setModalFalse,tipebutton, tipebutton2 }) =>{
 
  return(
    <div className="modal-background">
      <div className="succes-reservation">
        {
          (succes===1)?//pipa
          <HiBadgeCheck />
          :(succes===2)?//signo de pregunta
          <BsFillPatchQuestionFill />
          :<BsPatchExclamationFill />//signo de exclamasion
        }
        
        {thanks && <h1>¡Muchas gracias!</h1>}
        <p>{succesMessage}</p>
        {
          thanks &&
          <Link to={"/"} onClick={onclick}>ok</Link>
        }
       
        {
          tipebutton === 4 &&
          <Link to={"/login"} onClick={onclick}>ok</Link>
        }
        {
          deleteAction &&
          <section className='yes-no'>
            <button onClick={()=>onclick(id.obj,id.id)} className="secundary">si</button>
            <button onClick={setModalFalse}>no</button>
          </section>
        }
         {
          tipebutton2 === 5 &&
          <Link onClick={onclick}>ok</Link>
        }
        
      </div>
    </div>
  )
}
export default ModalSuccesReservation;