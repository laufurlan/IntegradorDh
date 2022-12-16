import React from 'react';

const SecurityPolicy = ( {normas, seguridad, politicas}) =>{
  return(
    <div className="security-policy">
    <h3>Politicas de seguridad</h3>
    <div className='underline'></div>
    <div className="rules-container">
      <div>
        <section>
        <h3>Normas de la casa</h3>
        <ul>
          <li>{normas}</li>
        </ul>
        </section>
        <section>
        <h3>Salud y seguridad</h3>
          <ul>
            <li>{seguridad}</li>
           
          </ul>
        </section>
      </div> 
      <section>
      <h3>Politica de cancelacion</h3>
        <p>{politicas}</p>
      </section>
    </div>
  </div>

  )
}

export default SecurityPolicy;
