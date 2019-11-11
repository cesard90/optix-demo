import sys

from sqlalchemy import Column, ForeignKey, Integer, String, Boolean
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from flask_marshmallow import Marshmallow
from sqlalchemy import create_engine

Base = declarative_base()

class Machine(Base):
    __tablename__ = 'Machine'

    id = Column(Integer, primary_key=True)
    name = Column(String(30), nullable=True)
    enabled = Column(Boolean, nullable=True)
    type = Column(String(50), nullable=True)

    @property
    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'enabled': self.enabled,
            'type': self.type
        }

class Task(Base):
    __tablename__ = 'Task'

    id = Column(Integer, primary_key=True)
    name = Column(String(30), nullable=True)
    job_id = Column(Integer, ForeignKey('Job.id'), nullable=True)
    sequence = Column(Integer, nullable=True)
    
    @property
    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'job_id': self.job_id,
            'sequence': self.sequence
        }

class Job(Base):
    __tablename__ = 'Job'

    id = Column(Integer, primary_key=True)
    name = Column(String(30), nullable=True)
    tasks = relationship('Task',backref='tasks', lazy='dynamic')
    status = '' 
    @property
    def serialize(self):
        return {
            'id' : self.id,
            'name': self.name
        }

class Taskqueue(Base):
    __tablename__ = 'Task_queue'

    id = Column(Integer, primary_key=True)
    machine_id = Column(String(30), nullable=False)
    task_id = Column(Integer, nullable=False)
    status = Column(String(30), nullable=False)


engine = create_engine(
    "postgres://postgres:password@localhost:5432/postgres"
)

Base.metadata.create_all(engine)
