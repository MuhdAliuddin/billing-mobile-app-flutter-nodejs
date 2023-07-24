import React, { Component, Suspense } from "react";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import "./components/resources/scss/style.scss";

const loading = (
  <div className="pt-3 text-center">
    <div className="sk-spinner sk-spinner-pulse"></div>
  </div>
);

// Containers
const Home = React.lazy(() => import("./feature/home"));
const Login = React.lazy(() => import("./feature/login"));

class App extends Component {
  render() {
    return (
      <BrowserRouter>
        <Suspense fallback={loading}>
          <Routes>
            <Route exact path="/login" name="Login Page" element={<Login />} />
            <Route path="*" name="Home" element={<Home />} />
          </Routes>
        </Suspense>
      </BrowserRouter>
    );
  }
}

export default App;
