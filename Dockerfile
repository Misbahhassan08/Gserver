FROM nodered/node-red
RUN npm install node-red-contrib-google-cloud

COPY --chown=node-red:node-red flows.json /data
COPY --chown=node-red:node-red settings.js /data
COPY --chown=node-red:node-red privkey.pem /data
COPY --chown=node-red:node-red cert.pem /data
