import React from "react";
import { useEffect, useState } from "react";
import { FcPrevious, FcNext } from 'react-icons/fc';
import { FiX } from 'react-icons/fi';

const Carrousel = ({photos, onclick, indexPhotoInfinite}) =>{
  const [data, setData] = useState(photos);
  const [currentIndex, setCurrentIndex] = useState(0);
  const carrouselInfiniteScroll= (prev) =>{
    if(currentIndex === data.length-1){
      return setCurrentIndex(0);
    }
    if(prev === 1) {
      return setCurrentIndex(currentIndex-1);
    }
    return setCurrentIndex(currentIndex+1);
  }
  useEffect(()=>{
    const interval = setInterval(()=>{
      carrouselInfiniteScroll()
      {indexPhotoInfinite && indexPhotoInfinite()}
    }, 3000)
    return ()=>clearInterval(interval);
  })
  return( 
    <div className='principal-image'>
      {
        <div className="carrousel-container">
          <button 
            className='exit-button'
            onClick={onclick}
          >
            <FiX />
          </button>
          {data.map((item, index)=> <div key={item.id} style={{transform: `translate(-${currentIndex * 100}%)`}} className="carrousel-item"><img src={item.url} alt="" /></div>)}
          <button 
            className='prev-button'
            onClick={()=>carrouselInfiniteScroll(1)}  
          >
            <FcPrevious />
          </button>
          <button 
            className='next-button'
            onClick={()=>carrouselInfiniteScroll()}  
          >
            <FcNext />
          </button>
        </div>
      }
    </div>
  )
}
export default Carrousel;
