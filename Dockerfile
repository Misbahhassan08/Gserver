FROM nodered/node-red

# Copy package.json to the WORKDIR so npm builds all
# of your added nodes modules for Node-RED
COPY package.json .
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production

# Copy _your_ Node-RED project files into place
# NOTE: This will only work if you DO NOT later mount /data as an external volume.
#       If you need to use an external volume for persistence then
#       copy your settings and flows files to that volume instead.
COPY settings.js /data/settings.js
COPY flows_cred.json /data/flows_cred.json
COPY flows.json /data/flows.json

# You should add extra nodes via your package.json file but you can also add them here:
WORKDIR /usr/src/node-red
RUN npm install node-red-node-smooth
RUN apk add --no-cache --virtual buildtools build-base linux-headers udev python && \
    npm install --unsafe-perm --no-update-notifier --no-fund --only=production && \
    npm install node-red-node-mysql && \
    npm install node-red-contrib-postgresql && \
    npm i --unsafe-perm node-red-node-sqlite && \
    npm install node-red-contrib-google-cloud && \
    npm install npm install node-red-dashboard && \
    npm install node-red-node-email && \
    cp -R node_modules prod_node_modules  
