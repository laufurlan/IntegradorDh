import React from "react";
import { Routes, Route } from "react-router-dom";
import Footer from "./components/footer/Footer";
import Header from "./components/header/Header";
import Main from "./components/main/Main";
import CreateAccount from "./components/main/CreateAccount";
import "./styles/app.css";
import LoginForm from "./components/main/LoginForm";
import ProductDetail from "./components/main/main_components/ProductDetail";
import { AuthContextProvider } from "./components/context/AuthContext";
import Reservation from "./components/main/main_components/reservation_components/Reservation";
import Error from "./components/Error";
import ReservationMade from "./components/main/main_components/user_components/ReservationsMade";
import AddProduct from "./components/main/main_components/administration_components/AddProduct";

function App() {
 
  return (
    <div className="app">
      <AuthContextProvider>
        <Header />
        <Routes>
          <Route path ="/" element={<Main />} />
          <Route path ="/products/city/:id" element={<Main />} />
          <Route path="/create-account" element={<CreateAccount />} />
          <Route path="/login" element={<LoginForm />}/>
          <Route path="/booking-form/:id" element={<Reservation />}/>
          <Route path="/product-detail/:id" element={<ProductDetail />}/>
          <Route 
            path="/my-booking-list/" 
            element={
              <ReservationMade 
                name={"Mis reservas"}
                category={"Cliente"}
              />
            }
          />
          <Route 
            path="/my-product-list/" 
            element={
              <ReservationMade 
                name={"Mis productos"}
                category={"Administrador"}
              />
            }
          />
          <Route path="/create-product/" element={<AddProduct />}/>
          <Route 
            path="*" 
            element={
              <Error 
                error={404} 
                message={"Que miras bonito? anda pa alla"} 
              />
            }
          />       
        </Routes>
        <Footer />
      </AuthContextProvider>
    </div>
  );
}

export default App;
