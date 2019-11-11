import React from 'react'

const Jobs = ({jobs}) => {
    
    return (
        <div class="table-responsive" >
            <center><h1>Job List</h1></center>
            <table  class="table">
            <thead>
                <tr>
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">Detail</th>
                </tr>
            </thead>
            {jobs.map((job) => {
                return(
                    <tbody>
                        {job.map((job, id) => (
                            <tr>
                            <th scope="row">{job.id}</th>
                            <td>{job.name}</td>
                            <td><button className="btn btn-success" onClick={() => window.location.hash = "/jobDetail/" + job.id }> Detail</button>
                            </td>
                            </tr>
                  ))}
                    </tbody>
                )
            } )}
            
            </table>
            <br/>
            <button type="button" class="btn btn-default" onClick={() => window.location.hash = "/newjob/" }>New Job</button>
        </div>
    )
};



export default Jobs