import React from 'react';

const ProductImages = ({ principalPhoto, photos, onclick  }) => {

  return (
    <article className='product-images'>
       <div className='principal-photo'>
            <img src={principalPhoto} alt="" />
          </div>
      
        <div className='more-photos'>
        <div>
            {
              photos.map((photo, index) =>(    
                index < 2 && <img src={photo.url} key={photo.id} alt="" />   
              ))    
            }
          </div>
          <div>
            {
              photos.map((photo, index) =>(    
                index > 1 && index <4  && <img src={photo.url} key={photo.id} alt="" />   
              ))    
            }
            <button 
              className="open-modal-button"
              onClick={onclick}
            >
              Ver más
            </button>
          </div>
        </div>
    </article>
  )
}

export default ProductImages;