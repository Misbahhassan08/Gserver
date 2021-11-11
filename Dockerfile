FROM nodered/node-red
RUN npm install node-red-contrib-google-cloud
RUN npm install node-red-node-mysql
RUN npm install node-red-node-email
COPY --chown=node-red:node-red flows.json /data
COPY --chown=node-red:node-red settings.js /data
