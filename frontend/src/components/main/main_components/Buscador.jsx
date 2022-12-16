import Calendar from "../../general_components/Calendar";
import SearchLocation from '../../general_components/SearchLocation';
import { useState, useEffect } from "react";
import React from 'react';

const Buscador = ({ handleClickBuscador, handleOnchangeCalendar }) => {
  const [showLocationToSelect, setShowLocationToSelect] = useState(false);
  const [cities, setCities] = useState([]);
  
  const [inputValue, setInputValue] = useState({id:null, title: "¿a dónde vamos?"});
  const handleOption = (id, title) =>{
    setInputValue({
      id:id,
      title: title
    })
    setShowLocationToSelect(false);
  }

  const handleClickInputSearchLocation = () => {
    setShowLocationToSelect(true);
    if (showLocationToSelect) {
        setShowLocationToSelect(false);
    }
  }

  useEffect(()=>{
    fetch(`http://localhost:8080/cities`)
    .then(res => res.json())
    .then((data) => {
      setCities(data)
    })
  }, [])

  return (
    <div className="buscador">
      <h1>Busca ofertas en hoteles, casas y mucho más</h1>
      <div className="form">
        <section className="input">
          <input type="text" className="input"  value={inputValue.title} onClick={handleClickInputSearchLocation} />
          {showLocationToSelect &&
            <ul className="select">
              {cities.map((obj) => (
                <SearchLocation key={obj.id} obj={obj} onclick={handleOption} />
              ))}
            </ul>
          }
        </section>
        <Calendar 
          inline={false} 
          handleOnchangeCalendar={handleOnchangeCalendar}
        />
        <button type="submit" className="submit" onClick={() =>handleClickBuscador(inputValue.id, inputValue.title)}>Buscar</button>
      </div>
    </div>
  )
}

export default Buscador;
