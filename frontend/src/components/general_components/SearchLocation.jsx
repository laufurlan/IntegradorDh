import { MdOutlineLocationOn }  from 'react-icons/md';
import React from 'react';
import { Link } from "react-router-dom";

const SearchLocation = ({obj, onclick}) =>{


  return(
      <li key={obj.id} className="option" onClick={()=>onclick(obj.id, obj.title)}>
        <Link to={`/products/city/${obj.id}`}>
          <MdOutlineLocationOn className='logo'/>
          <section>
            <h3>{obj.title}</h3>
            <span>{obj.title}</span>
          </section> 
        </Link>
        <section className='line' />
      </li>
  )
}

export default SearchLocation;
