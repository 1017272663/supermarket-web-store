//Import libreria de react
import React from 'react';
//import './App.css';
//Import bootstrap
import {Navbar, Nav, Image} from "react-bootstrap"
// Import Views
import HomeView from "./views/HomeView";
import ProductoView from "./views/ProductoView";
// react router dom
import {BrowserRouter as Router, Switch, Route, Link} from "react-router-dom";
import RolView from './views/RolView';

import LogoApp from './assets/img/logo.jpg'

function App() {
  return(
     <Router>
      <Navbar className="navbar-custom" expand="lg">
      <Navbar.Brand>
        <Image height={70}  src={LogoApp}/>
      </Navbar.Brand>
      <Navbar.Toggle arial-controls="basic-navbar-nav"/>
      <Navbar.Collapse id="basic-navbar-nav">
        <Nav className="mr-auto">
          <Link className= "custom-Link" to="/">Home</Link>
          <Link className= "custom-Link" to="/producto"> Producto</Link>
        </Nav>
      </Navbar.Collapse>
      </Navbar>
        <Switch>
          <Route exact={true} path="/" component={HomeView}/>
          <Route path="/producto" component={ProductoView}/>
        </Switch>
      </Router>
  );
}

export default App;
