FROM quay.io/lagomes/nodejs-14:1-79
WORKDIR /opt/app-root/src
USER 1001
COPY [ "server.js","index.html","package.json","./" ]
RUN mkdir /tmp/data
RUN npm config rm proxy
RUN npm config rm https-proxy
RUN npm install
ONBUILD COPY src/ .
ADD img/openshift.jpg ./img/openshift.jpg
VOLUME [ "data/" ]
EXPOSE 8080
CMD [ "npm", "start" ]
