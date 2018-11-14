#!/bin/bash 
service nginx start 
#gunicorn -k gevent run:app -b 0.0.0.0:8000
frps -c /app/frp/frps.ini &
#python run.py
gunicorn3 -c gun.conf run:app
