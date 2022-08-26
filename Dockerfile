# pull official base image
FROM node:14-alpine as build

# set working directory
# this is the working folder in the container from which the app
# will be running from
WORKDIR /app

# add the node_modules folder to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# copy package.json file to /app directory for installation prep
COPY package.json ./
COPY yarn.lock ./

# install dependencies
RUN yarn --silent

# copy everything to /app directory
COPY . /app

# build the app 
RUN yarn build

# Stage 2 - build the final image using a nginx web server 
FROM nginx:1.17.10-alpine

# Copy static build
COPY --from=build /app/build /usr/share/nginx/html/

# Copy .env file and shell script to container
COPY env-config-script.sh /usr/share/nginx/html/
COPY env-config-template /usr/share/nginx/html/

# needed this to make React Router work properly 
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Default port exposure
EXPOSE 80

# Make our shell script executable
RUN chmod +x /usr/share/nginx/html/env-config-script.sh

# Start Nginx server
CMD ["/bin/sh", "-c", "/usr/share/nginx/html/env-config-script.sh && nginx -g \"daemon off;\""]
