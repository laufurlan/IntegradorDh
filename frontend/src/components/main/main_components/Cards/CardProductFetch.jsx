import React from "react";
import { useState, useEffect } from 'react';
import CardProductList from "./CardProductList";
import { format } from "date-fns";


const CardProductFetch = ({ infoCity, fetchCity, fetchCategory, fetchCalendar, startAndEndDate }) => {
  const [ products, setProducts ] = useState([]);
  const [ title, setTitle ] = useState(`Recomendaciones`);
  const makeUrl = () =>{
    const url = (
      (fetchCategory <= 0) ?  
        fetchCity ?
          `http://localhost:8080/cities/${infoCity.id}` 
          : `http://localhost:8080/products/random`
        :`http://localhost:8080/categories/${fetchCategory.id}`
    );
    return url;
  }

  const makeTitle = () =>{
    const title = 
      fetchCalendar ?
        fetchCity ?
          `Alojamientos en ${infoCity.title} entre ${format(new Date(startAndEndDate.start),"dd/MM/yyyy")} y
          ${format(new Date(startAndEndDate.end),"dd/MM/yyyy")}` 
        :`Alojamientos disponibles entre ${format(new Date(startAndEndDate.start),"dd/MM/yyyy")} y 
        ${format(new Date(startAndEndDate.end),"dd/MM/yyyy")}`
      :(fetchCategory <= 0) ?  
          fetchCity ?
            `Alojamientos en ${infoCity.title}` 
          : `Recomendaciones`
        :`Recomendaciones para ${fetchCategory.title}`
    return title;
  }

  useEffect(() => { 
    if(fetchCalendar){
      fetch("http://localhost:8080/bookings/getAvailableProductsByDate", {
        method: "POST",
        body: JSON.stringify({
          initial_date: format(new Date(startAndEndDate.start),"yyyy-MM-dd"),
          final_date: format(new Date(startAndEndDate.end),"yyyy-MM-dd")
        }),
        headers: { "Content-type": "application/json; charset=UTF-8" },
      })
      .then((response) =>{
        return response.json();
      })
      .then((productsData) =>{
        setProducts(productsData);
        if(fetchCity){
          setProducts(products.filter((product)=>product.idCity === infoCity.id))
        }
        setTitle(makeTitle());
      })
    }else{
      fetch(makeUrl())
      .then((response) => {
        return response.json();
      })
      .then((products) => {
        setProducts((fetchCity || fetchCategory)  ? products.products : products )
        setTitle(makeTitle());
      })
    }
    
  }, [infoCity.id, fetchCategory, fetchCalendar])

  return (
    <>
     <CardProductList prod={products} title={title}/>
    </>
  );
}
// infoCategory
export default CardProductFetch;