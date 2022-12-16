import React from 'react'
import { useState, useEffect } from 'react';
import CardCategoriesList from './CardCategoriesList';


const CardCategoriesFetch = ({ onclick }) => {

  const [categories, setCategories] = useState([])

  useEffect(() => {
    fetch('http://localhost:8080/categories')
      .then((response) => {
        return response.json()
      })
      .then((categories) => {
        setCategories(categories)
      })
  }, [])

  return (
    <>
     <CardCategoriesList cat={categories} onclick={onclick}/>

    </>
  )
}

export default CardCategoriesFetch;
