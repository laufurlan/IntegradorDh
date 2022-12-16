import { Link } from "react-router-dom";
import logo from "../img/Logo/logo.svg";
import HeaderButtons from "./header_components/HeaderButtons";
import React from "react";
import UserHeaderComponent from "./header_components/UserHeaderComponent";
import BurgerMenuButton from "./header_components/BurgerMenuButton";
import { useAuthContext } from "../context/AuthContext";
import { useEffect, useState } from "react";
import BurgerMenu from "./header_components/BurgerMenu";

const Header = () => {
  const { logout, getUser } = useAuthContext();
  const user = getUser();
  const [width, setWidth] = useState(window.innerWidth);
  const [showBurgerMenuButton, setShowBurgerMenuButton] = useState(false);
  const [showBurgerMenu, setShowBurgerMenu] = useState(false);
  const [ signIn, setSignIn ] = useState(true);
  const [ logIn, setLogIn ] = useState(true);
  

  const handleChangeviewWidthSize = () => {
    setWidth(window.innerWidth);
  };

  const handleOpenBurgerMenu = () => {
    setShowBurgerMenu(true);
  };
  const handleCloseBurgerMenu = () => {
    setShowBurgerMenu(false);
  };

  const handleClickLogInSignIn = ( id ) =>{
    if(id === 1){
      setSignIn(false);
      setLogIn(true);
      setShowBurgerMenu(false);
    }
    if(id === 2){
      setSignIn(true);
      setLogIn(false);
      setShowBurgerMenu(false);
    }
    if(id === 3){
      setSignIn(true);
      setLogIn(true);
      setShowBurgerMenu(false);
    }
  }

  useEffect(() => {
    window.addEventListener("resize", handleChangeviewWidthSize);
    setShowBurgerMenuButton(width > 600 ? false : true);
  }, [width]);

  return (
    <nav
      className="header"
    >
      <Link to={"/"} onClick={()=>handleClickLogInSignIn(3)}>
        <img src={logo} alt="home digital booking" />
      </Link>
      {!user ? (
        showBurgerMenuButton ? (
          <BurgerMenuButton handleOpenBurgerMenu={handleOpenBurgerMenu} />
        ) : (
          <HeaderButtons 
            onclick={handleClickLogInSignIn}
            signIn={signIn}
            logIn={logIn}
          />
        )
      ) : showBurgerMenuButton ? (
        <BurgerMenuButton handleOpenBurgerMenu={handleOpenBurgerMenu} />
      ) : (
        <UserHeaderComponent {...user} doLogout={logout} burgerStyle={false} />
      )}
      {showBurgerMenu && (
        <BurgerMenu
          handleCloseBurgerMenu={handleCloseBurgerMenu}
          {...user}
          doLogout={logout}
          user={user ? true : false}
          handleClickLogInSignIn={handleClickLogInSignIn}
          signIn={signIn}
          logIn={logIn}
        />
      )}
    </nav>
  );
};

export default Header;
