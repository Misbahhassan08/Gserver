FROM nodered/node-red:latest

COPY package.json .
COPY settings.js .
COPY flows_cred.json .
COPY flows.json .
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production
RUN apk add --no-cache --virtual buildtools build-base linux-headers udev python && \
    npm install --unsafe-perm --no-update-notifier --no-fund --only=production && \
    npm install node-red-node-mysql && \
    npm install node-red-contrib-postgresql && \
    npm i --unsafe-perm node-red-node-sqlite && \
    npm install node-red-contrib-google-cloud && \
    npm install npm install node-red-dashboard && \
    npm install node-red-node-email && \
    cp -R node_modules prod_node_modules  


# You should add extra nodes via your package.json file but you can also add them here:
#WORKDIR /usr/src/node-red


