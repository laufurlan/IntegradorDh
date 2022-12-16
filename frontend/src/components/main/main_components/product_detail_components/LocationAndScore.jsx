import { AiFillStar, AiOutlineStar } from 'react-icons/ai';
import { MdOutlineLocationOn } from 'react-icons/md';
import React from 'react';

const LocationAndScore = ({ city, score}) => {
  return (
    <section className='product-location-and-score'>
      <div className='product-location'>
        <MdOutlineLocationOn />
        <section className='location-info'>
          <p>{city}</p>
          <span>A 940 m del centro</span>
        </section>
      </div>
      <div className='product-score'>
        <section>
          <span>Muy bueno</span>
          <span>
            <AiFillStar />
            <AiFillStar />
            <AiFillStar />
            <AiFillStar />
            <AiOutlineStar />
          </span>
        </section>
        <div className='product-number-score'>{score}</div>
      </div>
    </section>
  )
}

export default LocationAndScore;