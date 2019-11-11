import React, { Component } from "react";
import Machines from '../model/machines';
 
class Machine extends Component {
  render() {
    return (
      <Machines machines={this.state.machines} />
    );
  }
  state = {
    machines: []
  };

  componentDidMount() {
    fetch('http://localhost:4996/api/machines')
        .then(res => res.json())
        .then((data) => {
            this.setState({ machines: data })
        })
        .catch(console.log)
  }
}
 
export default Machine;
