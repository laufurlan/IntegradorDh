import React from 'react';
import { BsXLg } from 'react-icons/bs';
import { Link } from 'react-router-dom';
import scaloni from '../../img/scaloni.png';

const UserHeaderComponent = ({ handleCloseBurgerMenu, user_name, user_lastname, authorities, doLogout, burgerStyle }) => {
    return (
        <div className={burgerStyle ? "burger-style-header-avatar" : "header-avatar"} >
            <div>
                {
                    !burgerStyle &&
                    <section className='user-role'>
                        {
                            authorities === "ROLE_client" ?
                            <Link to={"/my-booking-list"}>Mis reservas</Link>
                            : <Link to={"/my-product-list"}>Mis productos</Link>
                        }
                        
                        <div className='divider'></div>
                    </section>
                }
                
                <section className='avatar'>
                {user_name.slice(0,1)} {user_lastname.slice(0,1)}
                </section>
                <section className={burgerStyle ? "burger-style-avatar-info" : "avatar-info"}>
                    <span>Hola, </span>
                    <p>{user_name} {user_lastname}</p>
                </section>
                {
                    burgerStyle &&
                    <section className='user-role'>
                        <div className='divider'></div>
                        {
                            authorities === "ROLE_client" ?
                            <Link to={"/my-booking-list"} onClick={handleCloseBurgerMenu}>Mis reservas</Link>
                            : <Link to={"/my-product-list"} onClick={handleCloseBurgerMenu}>Mis productos</Link>
                        }
                    </section>
                }
            </div>
            {
                burgerStyle 
                    ? <p>
                        ¿Deseas 
                        <button 
                            className='quit-button' 
                            onClick={doLogout}
                        >
                            cerrar sesion
                        </button>?
                      </p> 
                    : <button className='quit-button' onClick={doLogout}><BsXLg /></button>
            }
            
        </div>

    );

}

export default UserHeaderComponent;
