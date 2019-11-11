import React from 'react'
const JobDet = ({jobs}) => {
    return (
        <div class="table-responsive" >
            <center><h1>Job Detail</h1></center>
            
            
            <table  class="table">
            <thead>
                <tr>
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">Status</th>
                <th scope="col">Tasks</th>
                </tr>
            </thead>
            <tbody>
            {jobs.map((job) => (
                <tr>
                 <th scope="row">{job.id}</th>  
                 <td>{job.name}</td>
                 <td>{job.status}</td>
                 <td>
                 {job.tasks.map((task) => (
                     <h>{task.name}<br></br></h>
                 ))} 
                 </td>
                </tr>
            ))}
            </tbody>
            </table>
            <br/>
            <button type="button" class="btn btn-default" onClick={() => window.location.hash = "/job/" }>Go to Job List</button>
        </div>
    )
};

export default JobDet