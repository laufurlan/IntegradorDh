import { BsWifi, BiSwim }from 'react-icons/bs';

const cardProducto = () =>{
  return(
    <div className="product-card">
      <section className='product-photo'>
        <div className="like"></div>
        <img src={Imagen} alt="" />
      </section>
      <article className="product-info">
        <section>
          <div className='product-header'>   
            <div className='left'>
              <span>HOTEL</span>
              <h3>Hermitage hotel</h3>
            </div>
            <div className='rigth'>
              <div className="score">8</div>
              <span>Muy bueno</span>
            </div>
          </div>
          <div className='info'>
            <section>
              <p>A 940 m del centro MOSTRAR EN EL MAPA</p>
            </section>
            <section>
              <BiSwim />
              <BsWifi />
            </section>
          </div>
        </section>
        <section className='description'>
          <p>En el corazón de San Telmo, disfruta de un albergue inspirado en las pasiones de Buenos Aires.</p>
          <button>Ver más</button>
        </section>
      </article>
    </div>
  )
}

export default cardProducto;
