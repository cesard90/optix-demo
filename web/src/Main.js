import React, { Component } from "react";
import { Route, NavLink, HashRouter} from "react-router-dom";
import Home from "./components/Home";
import Machine from "./components/Machine";
import Job from "./components/Job";
import JobDetail from "./components/JobDetail"


class Main extends Component {
  render() {
    return (
      <HashRouter>
        <div>
          <h1>OPTIX</h1>
          <ul className="header">
            <li><NavLink exact to="/">Home</NavLink></li>
            <li><NavLink to="/machine">Machines</NavLink></li>
            <li><NavLink to="/job">Jobs</NavLink></li>
          </ul>
          <div className="content">
            <Route exact path="/" component={Home}/>
            <Route path="/machine" component={Machine}/>
            <Route path="/job" component={Job}/>
            <Route path="/jobDetail/" component={JobDetail}/>
            <Route path="/newjob/" component={Job}/>
          </div>
        </div>
      </HashRouter>
    );
  }
}

export default Main;
