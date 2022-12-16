import { AiOutlineArrowLeft } from 'react-icons/ai'
import React from 'react';
import { Link } from 'react-router-dom';

const TitleAndBackButton = ({category, name}) =>{
  return(
    <section className='product-title-and-back-button'>
        <div className='product-title'>
          <span>{category}</span>
          <h2>{name}</h2>
        </div>
        <Link to={-1}>
          <button>
            <AiOutlineArrowLeft />
          </button>
        </Link>
      </section>
  )
}

export default TitleAndBackButton;