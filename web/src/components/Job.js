import React, { Component } from "react";
import Jobs from "../model/jobs"
 
class Job extends Component {

  render() {
    return (
      <Jobs jobs={this.state.jobs} />
    );
  }
  state = {
    jobs: []
  };

  viewJob(id) {
    window.localStorage.setItem("jobId", id);
    this.props.history.push('/jobDetail');
  }

  componentDidMount() {
    fetch('http://localhost:4996/api/jobs')
        .then(res => res.json())
        .then((data) => {
          this.setState({ jobs: [data.jobs] })
        })
        .catch(console.log)
  }
}
export default Job;
