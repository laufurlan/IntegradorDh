import Buscador from "./main_components/Buscador";
import CardCategoriesFetch from "./main_components/Cards/CardCategoriesFetch"
import CardProductFetch from "./main_components/Cards/CardProductFetch"
import React from 'react'
import { useState, useEffect } from "react"

const Main = () =>{
  const [ fetchCity, setFetchCity ] = useState(false);
  const [ fetchCategory, setFetchCategory ] = useState(false);
  const [ inputValue, setInputValue ] = useState({id: null, title:null});
  const [ startAndEndDate, setStartAndEndDate ] = useState({start: null, end: null});
  const [ fetchCalendar, setFetchCalendar ] = useState(false);

  useEffect(()=>{
    handleOnchangeCalendar(startAndEndDate.start, startAndEndDate.end);
  },[startAndEndDate.end])
  
  const handleOnchangeCalendar = (start, end) =>{
    setStartAndEndDate({
      start: start,
      end: end
    })
    console.log(startAndEndDate, "josefina date cuenta")
  }

  const handleClickBuscador = (id, title) =>{
    console.log("click", inputValue.id)
    if(startAndEndDate.start === null && startAndEndDate.end === null){
      setInputValue({
        id: id,
        title: title,
      })
      setFetchCity(true);
      setFetchCalendar(false);
    console.log("solo ciudad")

    }else if(inputValue.id === null){
      setFetchCity(false);
      setFetchCalendar(true);
    console.log("solo calendario")
      
    }else{
      setInputValue({
        id: id,
        title: title,
      })
      setFetchCity(true);
      setFetchCalendar(true);
    console.log("los dos")
    } 
    setFetchCategory(false);
   }

  const handleOnClickCategory = (id, title) =>{
    setFetchCategory({id: id, title: title});
    setFetchCity(false)
    setFetchCalendar(false);
    handleOnchangeCalendar(null, null);
  }
 
  return(
    <div className='main'>
      <Buscador 
        handleClickBuscador={handleClickBuscador}
        handleOnchangeCalendar={handleOnchangeCalendar} 
      />
      <CardCategoriesFetch onclick={handleOnClickCategory}/>
      <CardProductFetch 
        infoCity={inputValue}
        fetchCity={fetchCity}
        fetchCategory={fetchCategory}
        fetchCalendar={fetchCalendar}
        startAndEndDate={startAndEndDate}
      />
    </div>
  )
}

export default Main;
