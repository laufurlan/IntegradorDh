import { AiFillCar } from 'react-icons/ai'
import { MdOutlineMicrowave, MdPets } from 'react-icons/md';
import { BiSun } from 'react-icons/bi';
import { TbDeviceTvOld, TbSwimming } from 'react-icons/tb';
import { AiOutlineWifi } from 'react-icons/ai';
import React from 'react';

const Atributes = ({ attributes }) => {

  return (
    <article className='caracteristics'>
      <h3>¿Que ofrece este lugar?</h3>
      <div className='underline'></div>
      <section className='caracteristic-container'>

      <div>
          {attributes.length>0 && 
            attributes[0].id === 1 &&<div className='atribute'>
              <MdOutlineMicrowave />
              <span>Cocina</span>
          </div>} 
          <div className='atribute'>
            <TbDeviceTvOld />
            <span>Televisor</span>
          </div>
          <div className='atribute'>
            <BiSun />
            <span>Aire acondicionado</span>
          </div>
          <div className='atribute'>
            <MdPets />
            <span>Apto mascotas</span>
          </div>
        </div>
        <div>
          <div className='atribute'>
            <AiFillCar />
            <span>Estacionamiento gratuito</span>
          </div>
          <div className='atribute'>
            <TbSwimming />
            <span>Pileta</span>
          </div>
          <div className='atribute'>
            <AiOutlineWifi />
            <span>Wifi</span>
          </div>
        </div>
      </section>
    </article>
  )
}

export default Atributes;