import { Link } from "react-router-dom";
import React from "react";
import { useNavigate } from "react-router-dom";
import { useState, useEffect } from "react";
import { useAuthContext } from "../context/AuthContext";
import ModalSuccesReservation from "./main_components/reservation_components/ModalSuccesReservation";

const CreareAccount = () => {
  const [ showModalInvalid, setShowModaleInvalid ] = useState(false);
  const navigate = useNavigate();
  const { login } = useAuthContext();
  const setShowModalInvalidFalse = () =>{
    setShowModaleInvalid(false)
  }

  const [values, setValues] = useState({
    name: "",
    last_name: "",
    email: "",
    password: "",
    confirmpassword: "",
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

  const [errors, setErrors] = useState({});

  const validateForm = (values) => {
    let errors = {};
    let regexName = /^[A-Za-zÑñÁáÉéÍíÓóÚúÜü\s]+$/;
    let regexEmail = /^(\w+[/./-]?){1,}@[a-z]+[/.]\w{2,}$/;
    let regexPassword = /^.{6,18}$/;

    if (!values.name.trim()) {
      errors.name = "El campo 'Nombre' es requerido";
    } else if (!regexName.test(values.name.trim())) {
      errors.name =
        "El campo 'Nombre' solo acepta letras y espacios en blanco ";
    }

    if (!values.last_name.trim()) {
      errors.last_name = "El campo 'Apellido' es requerido";
    } else if (!regexName.test(values.last_name.trim())) {
      errors.last_name =
        "El campo 'Apellido' solo acepta letras y espacios en blanco ";
    }

    if (!values.email.trim()) {
      errors.email = "El campo 'Email' es requerido";
    } else if (!regexEmail.test(values.email.trim())) {
      errors.email = "Ingrese un Email Valido";
    }

    if (!values.password.trim()) {
      errors.password = "Por favor ingrese una contraseña";
    } else if (!regexPassword.test(values.password.trim())) {
      errors.password =
        "La contraseña debe contener un minimo de 6 caracteres y maximo de 18";
    }

    if (!values.confirmpassword.trim()) {
      errors.confirmpassword = "Por favor confirme su contraseña";
    } else if (values.password !== values.confirmpassword) {
      errors.confirmpassword = "Las contraseñas no coinciden";
    }

    return errors;
  };

  const [myStatus, setMyStatus] = useState();

  const createUser = (name, last_name, email, password) => {
    fetch("http://localhost:8080/api/auth/register", {
      method: "POST",
      body: JSON.stringify({
        email: email,
        name: name,
        last_name: last_name,
        password: password,
      }),
      headers: { "Content-type": "application/json; charset=UTF-8" },
    }).then((response) => setMyStatus(response.status));
  };
  useEffect(() => {
    if (myStatus === 400) {
      setShowModaleInvalid(true);
    } else if (myStatus === 200) {
      login(values.email, values.password).then((response) => {
        if (response) navigate("/");
      });
    }
  }, [myStatus]);

  const handleSubmit = (e) => {
    e.preventDefault();
    if (Object.keys(errors).length <= 0) {
      createUser(values.name, values.last_name, values.email, values.password);
    }
  };

  return (
    <div className="sign-in-form">
      <form onSubmit={handleSubmit}>
        <h2>Crear cuenta</h2>
        <div className="form-inputs">
          <section className="name-surname">
            <div>
              <label htmlFor="name" className="input">
                {" "}
                Nombre:
                <input
                  type="text"
                  id="name"
                  name="name"
                  placeholder="Escribe tu Nombre"
                  value={values.name}
                  onChange={handleChange}
                />
              </label>
              {errors.name && <p>{errors.name}</p>}
            </div>
            <div className="last_name">
              <label htmlFor="last_name" className="input">
                {" "}
                Apellido:
                <input
                  type="text"
                  id="last_name"
                  name="last_name"
                  placeholder="Escribe tu Apellido"
                  value={values.last_name}
                  onChange={handleChange}
                />
              </label>
              {errors.last_name && <p>{errors.last_name}</p>}
            </div>
          </section>
          <label htmlFor="email" className="input">
            {" "}
            Email:
            <input
              type="email"
              id="email"
              name="email"
              placeholder="Ingresa tu Email"
              value={values.email}
              onChange={handleChange}
            />
          </label>
          {errors.email && <p>{errors.email}</p>}
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
            />
          </label>
          {errors.password && <p>{errors.password}</p>}
          <label htmlFor="confirmpassword" className="input">
            {" "}
            Confirmar Contraseña:
            <input
              type="password"
              id="password"
              name="confirmpassword"
              placeholder="Confirma tu contraseña"
              value={values.confirmpassword}
              onChange={handleChange}
            />
          </label>
          {errors.confirmpassword && <p>{errors.confirmpassword}</p>}
        </div>
        <div className="submit-buttons">
          <ul>
            <li>
              <button
                type="submit"
                onClick={() => {
                  setErrors(validateForm(values));
                }}
              >
                {" "}Enviar{" "}
              </button>
            </li>
            <li className="secundary-action">
              ¿Ya tenes cuenta?
              <Link to="/login">Iniciar sesion</Link>
            </li>
          </ul>
        </div>
      </form>
      {
        showModalInvalid &&
        <ModalSuccesReservation 
          onclick={setShowModalInvalidFalse}
          succesMessage={"El email ya se encuentra registrado"}
          succes={3}
        />
      }
    </div>
  );
};

export default CreareAccount;
