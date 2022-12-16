import { Link } from "react-router-dom";
import React from "react";


const HeaderButtons = ({ logIn, signIn, burgerStyle, onclick, handleCloseBurgerMenu }) =>{
  return(
    <ul className={burgerStyle && "burger-style"}>
      {
        signIn &&
        <li>
          <Link 
            to="/create-account" 
            onClick={()=>onclick(1)}
          >
            <button>Crear cuenta</button>
          </Link>
        </li>
      }
      {
        logIn &&
        <li>
          <Link 
            to="/login" 
            onClick={()=>onclick(2)}
          >
            <button>Inciar sesion</button>
          </Link>
        </li>
      }
    </ul>
  )
}

export default HeaderButtons;
