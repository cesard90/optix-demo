import React, { Component } from "react";
import JobDet from "../model/jobsDetail"
 
class JobDetail extends Component {
 
  render() {
    return (
      <JobDet jobs={this.state.jobs} />
    );
  }
  state = {
    jobs: []
  };

   

  componentDidMount() {
    
    var domain = window.location.href.split('/');
    fetch('http://localhost:4996/api/job/' + domain[domain.length - 1])
        .then(res => res.json())
        .then((data) => {
          this.setState({ jobs: data })
        })
        .catch(console.log)
  }
}
export default JobDetail;
