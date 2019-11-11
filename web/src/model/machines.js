import React from 'react'
const Machines = ({machines}) => {
    return (
        
        <div class="table-responsive" >
            <center><h1>Machine List</h1></center>
            <table  class="table">
            <thead>
                <tr>
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">Type</th>
                <th scope="col">Enabled</th>
                <th scope="col">Running</th>
                </tr>
            </thead>
            <tbody>
            {machines.map((machine) => (
                <tr>
                 <th scope="row">{machine.id}</th>  
                 <td>{machine.name}</td>
                 <td>{machine.type}</td>
                 <td>{machine.enabled}</td>
                 <td>{machine.running}</td>
                </tr>
            ))}
            </tbody>
            </table>
        </div>
       
    )
};

export default Machines