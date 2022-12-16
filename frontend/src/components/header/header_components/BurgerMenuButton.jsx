import { GiHamburgerMenu } from 'react-icons/gi';
import React from "react";

const BurgerMenuButton = ({ handleOpenBurgerMenu }) =>{
  return(
    <button className='burger-menu-button' onClick={handleOpenBurgerMenu}>
      <GiHamburgerMenu />
    </button>
  )
}

export default BurgerMenuButton;