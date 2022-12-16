import { AiOutlineHeart, AiOutlineShareAlt } from 'react-icons/ai';
import Calendar from '../../general_components/Calendar';
import TitleAndBackButton from './product_detail_components/TitleAndBackButton';
import LocationAndScore from './product_detail_components/LocationAndScore';
import ProductImages from './product_detail_components/ProductImages';
import Atributes from './product_detail_components/Atributes'
import ProductImagesModal from './product_detail_components/ProductImagesModal';
import { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import SecurityPolicy from './product_detail_components/SecurityPolicy';
import BookButton from './product_detail_components/BookButton';
import fotox from "../../img/fotox.svg"
import React from 'react';
import Carrousel from '../../general_components/Carrousel';

const ProductDetail = () => {
  const user = JSON.parse(sessionStorage.getItem("user"));
  const [ showModal, setShowModal ] = useState(false);
  const [ productDetailInfo, setProductDetailInfo ] = useState({attributes:[],url_image:'',category_name:'',title:'',images:[], house_rules:"", security:"", cancellation_policy:"" });
  const [ startAndEndDate, setStartAndEndDate ] = useState({start: null, end: null}); 

  const [ disableDatesArray, setDisableDatesArray ] = useState([]);
  const params = useParams();
  const [ showCarrousel, setShowCarrousel ] = useState(false);
  const [width, setWidth] = useState(window.innerWidth); 

  const handleChangeviewWidthSize = () =>{
    setWidth(window.innerWidth);
  }

  useEffect(() =>{
    handleChangeviewWidthSize();
    window.addEventListener('resize',handleChangeviewWidthSize);
    setShowCarrousel(width < 600 ? true : false );
  },[width]);
  
  const handleOnchangeCalendar = (start, end) =>{
    setStartAndEndDate({
      start: start,
      end: end
    })
  }
  const handleOpenModal = () =>{
    setShowModal(true);
  }
  const handleCloseModal = () =>{
    setShowModal(false);
  }

  useEffect(()=>{
    fetch(`http://localhost:8080/products/${params.id}`)
      .then(res => res.json())
      .then(function(response) {    
          setProductDetailInfo(response);
      })
      .catch(function(error) {
        console.log('Hubo un problema con la petición Fetch:' + error.message);
      });
  },[params.id])
  
  useEffect(()=>{
    fetch(`http://localhost:8080/bookings/reservedDatesByProduct/${params.id}`)
    .then((response) => response.json())
    .then((products) => {       
        setDisableDatesArray(products);
      })
      .catch(function(error) {
        console.log('Hubo un problema con la petición Fetch:' + error.message);
      });
  }, [params.id])

  return (
    <div className='product-detail'>
      {
        showModal && 
        <div className='modal-container'>
          <ProductImagesModal
            onclick={handleCloseModal}
            photos={productDetailInfo.images}
          />
        </div>
      }
      <TitleAndBackButton 
        category={productDetailInfo.category_name}
        name={productDetailInfo.title}
      />
      <LocationAndScore 
        city={'Buenos Aires, Ciudad Autónoma de Buenos Aires, Argentina'}
        score={8}
      />
      <div className='product-info'>
        <section className='booking-share-button'>
          <AiOutlineShareAlt />
          <AiOutlineHeart />
        </section>
        {
          showCarrousel 
          ? <Carrousel className='carrousel-photo' photos={productDetailInfo.images}/>
          : <ProductImages 
              principalPhoto={productDetailInfo.url_image}
              photos={productDetailInfo.images}
              onclick={handleOpenModal}
            />
        }
        
        <article>
          <h3>Alojate en {productDetailInfo.city_name} </h3>
          <p>
            {productDetailInfo.description}
          </p>
        </article>
        
      </div>
      <Atributes attributes={productDetailInfo.attributes}/> 
      
      <div className='image'>
        <img src={fotox} alt="mapa" />
      </div>

      <SecurityPolicy />
      {
        (user === null ||
          user.authorities === "ROLE_client") &&
            <article className='booking'>
              <Calendar 
                inline={true}
                handleOnchangeCalendar={handleOnchangeCalendar}
                disableDatesArray={disableDatesArray}
              />
              <BookButton productid={params.id} startAndEndDate={startAndEndDate}/>
            </article>
      }
      
    </div>
  )
}

export default ProductDetail;