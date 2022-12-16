import { BsXLg } from 'react-icons/bs';
import HeaderButtons from './HeaderButtons';
import FooterSocialContact from "../../footer/footer_components/FooterSocialContact";
import UserHeaderComponent from "./UserHeaderComponent";
import React from "react";




const BurgerMenu = ({ handleCloseBurgerMenu, user_name, user_lastname, doLogout, user, signIn, logIn, handleClickLogInSignIn }) =>{
  return(
    <div className='back-burger-menu'>
      <div className="burger-menu">
        <section className='header-burger-menu'>
          <button className='quit-button' onClick={handleCloseBurgerMenu}>
            <BsXLg />
          </button>
          {!user && <h2>Menu</h2>}
        </section>
        {!user && <div className='underline'></div>}
        {
          !user ? 
            <HeaderButtons 
              burgerStyle
              onclick={handleClickLogInSignIn}
              signIn={signIn}
              logIn={logIn}
              handleCloseBurgerMenu={handleCloseBurgerMenu}
            /> 
            : <UserHeaderComponent 
                user_name={user_name}
                user_lastname={user_lastname}
                doLogout={doLogout}
                user
                burgerStyle
                handleCloseBurgerMenu={handleCloseBurgerMenu}
              />
        }
        <FooterSocialContact />
      </div>
    </div>
  )
}

export default BurgerMenu; 