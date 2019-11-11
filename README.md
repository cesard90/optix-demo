# Web app for OPTIX

## About
This is a web app demo version written in Python-Flask for the back end and React-JS for the front end and using postgres as a database to show the data input/output from an AI optimization module.

## Techonology used
1. Back-End: Flask + SQLAlchemy
2. Front-End: React.js + Boostrapt
3. Database: Postgres 12 + pgAdmin 4
4. IDE: VS code

## Instructions
Below are the installing and running procedues
### Installing
1. Make sure you have python, npm, pip, postgres and pgAdmin 4 (or another sql to connect db and run scripts) installed on the target machine. (IMPORTANT)
For this project, I used : **npm v5.5.1**, **pip v19.2.3**, **python v3.7.5**, **postgres 12**
2. Open pgAdmin 4 and run files inside /Scripts folder:
   1. Objects.sql
   2. Inserts.sql
   Note: This object will be create in a database called *postgres* and schema *public*, please be sure that you have it on your postgres database before run this files. 
3. Enter in to the directary */web/* and run the command `npm install` to get all dependencies.
4. Create a python virtualenv.
5. Install flask with the commands: `$ pip install flask` , `$ pip install flask-cors` and `$ pip install sqlalchemy`.
6. Install Reactjs with the command `$ npm i react react-dom --save-dev`.
7. Setup the url connection database (user, passwork and port) in *db.py* file on the line 69.
### Running
1. Go to the root directory and start the back-end server with `python app.py` (Run over 4996 port).
2. Go to */web* directory and start the front-end server with `npm start`. 
3. If all is working correctly, you will be given an address http://127.0.0.1:3000/ 
### Some screenshots
1. Home Page 
![alt text](http://url/to/img.png)
2. Machine List
![alt text](http://url/to/img.png)
3. Job List
![alt text](http://url/to/img.png)
4. Job Detail
![alt text](http://url/to/img.png)
5. New Job - Postman
![alt text](http://url/to/img.png)

## Thank you!
I will be greatfull if you give me your feedback about my implementation to *cesard90@gmail.com*