import Calendar from "../../../general_components/Calendar";
import {BiCheckCircle} from "react-icons/bi";
import {useAuthContext} from "../../../context/AuthContext";
import React from "react";

const ReservationForm = ({ city, handleOnchangeCalendar }) =>{
  
  const { getUser} = useAuthContext();
  const user = getUser();
  return(
    <form className="form-container">
      <section className="user-reservation-info">
        <h2>Completá tus datos</h2>
        <div className="user-info-form">
          <section>
            <label>
              Nombre
              <input type="text" value={user.user_name}/>
            </label>
            <label>
              Apellido
              <input type="text" value={user.user_lastname}/>
            </label>
          </section>
          <section>
            <label>
              Correo electronico
              <input type="email" value={user.sub}/>
            </label>
            <label>
              Ciudad
              <input type="text" value={city} disabled/>
            </label>
          </section>
        </div>
      </section>
      <section className="reservation-calendar">
        <h2>Seleccioná tu fecha de reserva</h2>
        <div>
        <Calendar 
          inline={true}
          handleOnchangeCalendar={handleOnchangeCalendar}
          dateInfo
        />
        </div>
      </section>
      <section className="time-arrival-select">
        <h2>Tu horario de llegada</h2>
        <div>
          <p>
            <BiCheckCircle />
            Tu habitación va a estar lista para el check-in entre las 10:00 AM y las 11:00 PM
          </p>
          <label>
            Indicá tu horario estimado de llegada 
            <select>
              <option value=""> 00:00 hs </option>
              <option value=""> 01:00 hs </option>
              <option value=""> 02:00 hs </option>
              <option value=""> 03:00 hs </option>
              <option value=""> 04:00 hs </option>
              <option value=""> 05:00 hs </option>
              <option value=""> 06:00 hs </option>
              <option value=""> 07:00 hs </option>
              <option value=""> 08:00 hs </option>
              <option value=""> 09:00 hs </option>
              <option value=""> 10:00 hs </option>
              <option value=""> 11:00 hs </option>
              <option value=""> 12:00 hs </option>
              <option value=""> 13:00 hs </option>
              <option value=""> 14:00 hs </option>
              <option value=""> 15:00 hs </option>
              <option value=""> 16:00 hs </option>
              <option value=""> 17:00 hs </option>
              <option value=""> 18:00 hs </option>
              <option value=""> 19:00 hs </option>
              <option value=""> 20:00 hs </option>
              <option value=""> 21:00 hs </option>
              <option value=""> 22:00 hs </option>
              <option value=""> 23:00 hs </option>
            </select>
          </label>
        </div>
      </section>
    </form>
  )
}

export default ReservationForm; 