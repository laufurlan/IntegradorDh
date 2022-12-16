
import React from 'react';
import Carrousel from '../../../general_components/Carrousel';
import { useState } from "react";


const ProductImagesModal = ({ onclick, photos }) => {
  const [indexPhoto, setIndexPhoto] = useState(1);
  const indexPhotoInfinite = () =>{
    if(indexPhoto === photos.length-1){
      return setIndexPhoto(1);
    }
    return setIndexPhoto(indexPhoto + 1);
  }
  return(
    <div className='product-images-modal'>
        <Carrousel className="carrousel" photos={photos} onclick={onclick} indexPhotoInfinite={indexPhotoInfinite}/>
      <span>{indexPhoto}/{photos.length}</span>
      <div className='secondary-images-container'>
        {
          photos.map((photo, index)=>{
            if(index <= 4){
              return  <div key={photo.id}>
                        <img src={photo.url} alt="" />
                      </div>
            }
          })
        }
      </div>
    </div>
  )
}

export default ProductImagesModal;