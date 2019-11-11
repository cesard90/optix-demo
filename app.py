import os,sys

from flask import Flask, render_template, request, redirect, url_for
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from db import Base, Machine, Task, Job, Taskqueue
from flask_marshmallow import Marshmallow, fields
from marshmallow import Schema, fields, pprint
from flask import jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

engine = create_engine(
    "postgres://postgres:password@localhost:5432/postgres"
)
Base.metadata.bind = engine

DBSession = sessionmaker(bind=engine)
session = DBSession()
ma = Marshmallow(app)

"""
api functions
"""
 
@app.route('/')
@app.route('/api/machines', methods=['GET'])
def machinesFunction():
    if request.method == 'GET':
        return get_machines()

@app.route('/api/jobs', methods=['GET'])
def jobFunction():
    if request.method == 'GET':
        return get_simple_job()

@app.route('/api/tasks', methods=['GET'])
def tasksFunction():
    if request.method == 'GET':
        return get_tasks()

@app.route('/api/job/<int:id>', methods=['GET', 'POST'])
def jobsFunction(id):
    if request.method == 'GET':
        return get_job(id)

    elif request.method == 'POST':   
        content = request.get_json(silent=True)
        #Save the job
        save_job(content)
        return 'job registered sucessfuly'   
 
"""
functions
"""

def get_machines():
    machines = session.execute('select M.id, M.name, M.type, M. enabled, (select CASE  WHEN count(1) > 0 then :vT else :vF end  from "Task_queue" as TQ WHERE TQ.machine_id = M.id AND TQ.status = :val ) as running from "Machine" as M order by M.name asc',{'val':'Running', 'vT':'True','vF':'False'})
    return jsonify(MachineSchema(many=True).dump(machines))


def get_tasks():
    tasks = session.query(Task).all()
    return jsonify(tasks=[b.serialize for b in tasks])

def get_simple_job():
    jobs = session.query(Job).all()
    return jsonify(jobs=[b.serialize for b in jobs])    

def get_job_status(job_id):
    status = session.execute('select case X.status  when :wait then :nc  when :running then :nc  else :complete  end as status from ( SELECT * FROM	(SELECT TQ.status as status, T.sequence FROM public."Job" as J LEFT JOIN "Task" as T ON (T.job_id = J.id) LEFT JOIN "Task_queue" as TQ ON (TQ.task_id = T.ID) WHERE J.id= :idx order by T.sequence desc  ) Y limit 1) X',{'idx':job_id, 'wait':'Waiting', 'complete':'Complete', 'running':'Running', 'nc' : 'No complete'})
    for s in status:
        return s
    return '' 

def get_job(job_id):
    jobs = session.query(Job).filter_by(id=job_id)
    status = get_job_status(job_id)
    for j in jobs:
      j.status=status[0]
    job_schema = JobSchema(many=True)
    output = job_schema.dump(jobs)
    
    return jsonify(output)

def save_job(content):
    job = Job()
    job.name = content['name']
    session.add(job)
    session.commit() 
    #Save tasks & taskqueue
    tasks = content['tasks']
    for t in tasks:
      save_task(t, job.id)
    return 'ok'  

def save_task(task_request,job_id ):
    task = Task()
    task.name = task_request['name']
    task.sequence = task_request['sequence']
    task.job_id = job_id
    session.add(task)
    session.commit() 
    save_taskqueue(task_request, task.id)
    return 'ok'

def save_taskqueue(taskq_request, task_id):
    taskqueue = Taskqueue()
    taskqueue.task_id = task_id
    taskqueue.machine_id = taskq_request['machine']
    taskqueue.status = 'Waiting'
    session.add(taskqueue)
    session.commit() 
    return 'ok'
    
"""
Schemas
"""
class MachineSchema(ma.Schema):
    id = fields.String()
    name = fields.String()
    type = fields.String()
    enabled = fields.String()
    running = fields.String()

class TaskSchema(ma.Schema):
    id = fields.String()
    name = fields.String()
    
class JobSchema(ma.Schema):
    id = fields.String()
    name = fields.String()
    status = fields.String()
    tasks = fields.Nested(TaskSchema, many=True)    

           
if __name__ == '__main__':
    app.debug = True
    app.run(host='0.0.0.0', port=4996)

