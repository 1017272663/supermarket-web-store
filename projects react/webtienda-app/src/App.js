//Import libreria de react
import React from 'react';
//import './App.css';
//Import bootstrap
import {Navbar, Nav} from "react-bootstrap"
// Import Views
import HomeView from "./views/HomeView";
import RolView from "./views/RolView";
// react router dom
import {BrowserRouter as Router, Switch, Route, Link} from "react-router-dom";

function App() {
  return(
     <Router>
      <Navbar bg="light" expand="lg">
      <Navbar.Brand href="#home">Este es el Menu</Navbar.Brand>
      <Navbar.Toggle arial-controls="basic-navbar-nav"/>
      <Navbar.Collapse id="basic-navbar-nav">
        <Nav className="mr-auto">
          <Link to="/">Home</Link>
          <Link to="/rol"> Rol</Link>
        </Nav>
      </Navbar.Collapse>
      </Navbar>
        <Switch>
          <Route exact={true} path="/" component={HomeView}/>
          <Route path="/rol" component={RolView}/>
        </Switch>
      </Router>
  );
}

export default App;
