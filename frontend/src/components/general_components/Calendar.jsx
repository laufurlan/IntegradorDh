import { useState } from "react";
import DatePicker, { registerLocale } from "react-datepicker";
import es from "date-fns/locale/es"
import React from 'react';
import { useEffect } from "react";
registerLocale("es", es);

const Calendar = ({ dateInfo, inline, handleOnchangeCalendar, disableDatesArray }) => {
  const [ date, setDateInfo ] = useState(JSON.parse(sessionStorage.getItem("infoDate")))
  const [startDate, setStartDate] = useState(null);
  const [endDate, setEndDate] = useState(null);
  const [ showMonths, setShowMonths ] = useState(window.innerWidth > 400 ? false : true)
  const [ disableDates, setDisableDates] = useState([])
  const [width, setWidth] = useState(window.innerWidth);

  const handleChangeviewWidthSize = () =>{
    setWidth(window.innerWidth);
  }
  useEffect(() =>{
    handleChangeviewWidthSize()
    window.addEventListener("resize",handleChangeviewWidthSize);
    setShowMonths(width > 600 ? 2 : 1); 
  }, [width]);
 const generateDisabledDays = () =>{
  if(disableDatesArray){
    const array= [];
    disableDatesArray.map((element)=>{
      array.push({start: new Date(element.initial_date), end: new Date(element.final_date)})
    })
    setDisableDates(array);
  } else {
    return 0;
  }
  };

  useEffect(()=>{
    handleOnchangeCalendar(startDate, endDate);
  },[endDate])

  useEffect(()=>{
    if(dateInfo){ 
      setStartDate(new Date(date.start));
      setEndDate(new Date(date.end));
    }
  },[])

  const onChange = (dates) => {
    const [start, end] = dates;
    setStartDate(start);
    setEndDate(end);
  }; 
 
  return (
    <DatePicker 
      className="input"
      locale={"es"}
      placeholderText="Check in - Check out"
      monthsShown={showMonths}
      onChange={onChange}
      startDate={startDate}
      endDate={endDate}
      minDate={new Date()}
      excludeDateIntervals={[]}
      selectsRange
      inline={inline}
    />

  );
}

export default Calendar;

