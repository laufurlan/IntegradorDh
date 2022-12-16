import React, { createContext, useState, useContext } from "react";
import { isExpired, decodeToken } from "react-jwt";

export const AuthContext = createContext();

export function AuthContextProvider({ children }) {
  const [jwt, setJwt] = useState(JSON.parse(sessionStorage.getItem("jwt")));
  const [userLogged, setUserLogged] = useState(
    JSON.parse(sessionStorage.getItem("user"))
  );

  const login = async (email, password) => {
    const response = await fetch("http://localhost:8080/api/auth/login", {
      method: "POST",
      body: JSON.stringify({
        email: email,
        password: password,
      }),
      headers: { "Content-type": "application/json; charset=UTF-8" },
    });
    const data = await response.json();
    setJwt(data.token);
    const userData = decodeToken(data.token);
    if (!userData) {
      return false;
    }
    sessionStorage.setItem("user", JSON.stringify(userData));
    sessionStorage.setItem("jwt", JSON.stringify(data.token));
    setUserLogged(userData);
    return true;
  };

  const logout = () => {
    sessionStorage.removeItem("user");
    sessionStorage.removeItem("jwt");
    setUserLogged(null);
  };

  const getUser = () => {
    const isExpiredUser = isExpired(jwt);
    if (isExpiredUser) {
      logout();
      return false;
    }
    return userLogged ? userLogged : false;
  };

  return (
    <AuthContext.Provider value={{ login, logout, getUser }}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuthContext() {
  return useContext(AuthContext);
}