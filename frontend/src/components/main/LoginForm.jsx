import { Link, useNavigate} from "react-router-dom";
import { useState } from "react";
import React from "react";
import {useAuthContext} from "../context/AuthContext";
import ModalSuccesReservation from "./main_components/reservation_components/ModalSuccesReservation";


const LoginForm = () => {
  const [ showModalInvalid, setShowModaleInvalid ] = useState(false);
  const path = localStorage.getItem("path")
  const {login} = useAuthContext();
  const navigate = useNavigate();

  const setShowModalInvalid = () =>{
    setShowModaleInvalid(false);
  }

  const [values, setValues] = useState({
    email: "",
    password: "",
  });

  function handleChange(e) {
    const { target } = e;
    const { name, value } = target;
    const newValues = {
      ...values,
      [name]: value,
    };
    setValues(newValues);
  }

  const handleSubmit = (e) => {
    e.preventDefault()
    login(values.email, values.password).then((response)=>{
      if (!response){
        setShowModaleInvalid(true);
      } else {
        localStorage.removeItem("path") 
        navigate(-1)
      }
   })
  };
  
 const warning = () => {
  if (path){
    return (<h4>Para realizar una reserva es obligatorio el login. Si no tiene cuenta, deberá registrarse</h4>);
  }
 }

  

  return (

    <div className="login-form">
      <form onSubmit={handleSubmit}>
        {warning ()}
        <h2>Inciar Sesion</h2>
        <div className="form-inputs">
          <label htmlFor="email" className="input">
            {" "}
            Email:
            <input
              type="email"
              id="email"
              name="email"
              value={values.email}
              onChange={handleChange}
              placeholder="Ingresa tu Email"
              required
            />
          </label>
          <label htmlFor="password" className="input">
            {" "}
            Contraseña:
            <input
              type="password"
              id="password"
              name="password"
              placeholder="Ingresa una contraseña"
              value={values.password}
              onChange={handleChange}
              required
            />
          </label>
        </div>

        <div className="submit-buttons">
          <ul>
            <li>
              {" "}
              <button type="submit" >
                Ingresar
              </button>
            </li>
            <li className="secundary-action">
              ¿Aún no tenes cuenta?
              <Link to="/create-account">Registrarse</Link>
            </li>
          </ul>
        </div>
      </form>
      {
        showModalInvalid &&
        <ModalSuccesReservation 
        onclick={setShowModalInvalid}
          succesMessage={"Credenciales invalidas"}
          tipebutton2={5}
        />
      }
    </div>
  );
};

export default LoginForm;

