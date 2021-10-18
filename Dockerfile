FROM nodered/node-red:latest

COPY package.json .
COPY settings.js .
COPY flows_cred.json .
COPY flows.json .
