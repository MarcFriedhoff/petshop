import React from 'react';
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";
import Home from './home';
import Pet from './pet';
import PetsByStatus from './petsbystatus';

const Webpages = () => {
    return(
        <Router>
            <Route exact path="/" component= {Home} />
            <Route path = "/pet/:id" component = {Pet} />
	        <Route path = "/petsbystatus/:petStatus" component = {PetsByStatus} />
        </Router>
    );
};

export default Webpages;
