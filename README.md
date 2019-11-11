# Web app for OPTIX

## About
This is a web app demo version written in Python-Flask for the back end and React-JS for the front end and using Postgresql as a database to show the data input/output from an AI optimization module.

## Technology used
1. Back-End: Flask + SQLAlchemy
2. Front-End: React.js + Boostrapt
3. Database: Postgresql 12 + pgAdmin 4
4. IDE: VS code

## Instructions
Below are the installing and running procedues
### Installing
1. Make sure you have python, npm, pip, postgresql and pgAdmin 4 (or another sql to connect db and run scripts) installed on the target machine. (IMPORTANT)
For this project, I used : **npm v5.5.1**, **pip v19.2.3**, **python v3.7.5**, **postgresql 12**
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
![alt text](https://raw.githubusercontent.com/cesard90/optix-demo/master/images/1.%20Welcome.png?token=ACAIXJL7FYR7KUIQMPU2NUK5ZDC4O)
2. Machine List
![alt text](https://raw.githubusercontent.com/cesard90/optix-demo/master/images/2.%20Machines.png?token=ACAIXJIX5QJRMMEOUOTQQOC5ZDC6U)
3. Job List
![alt text](https://raw.githubusercontent.com/cesard90/optix-demo/master/images/3%20.Jobs.png?token=ACAIXJODDDYAH3OQLLVIGDS5ZDC64)
4. Job Detail
![alt text](https://raw.githubusercontent.com/cesard90/optix-demo/master/images/4.%20JobDetail.png?token=ACAIXJMVTKY7WKNVDHHU2O25ZDC7C)
5. New Job - Postman
![alt text](https://raw.githubusercontent.com/cesard90/optix-demo/master/images/5.%20New%20Job.png?token=ACAIXJLSJFSAKIQ3QJ4RXES5ZDC7O)

## Thank you!
I will be greatfull if you give me your feedback about my implementation to *cesard90@gmail.com*
