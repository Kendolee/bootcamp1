# use the official Nginx image from docker hub

FROM nginx:alpine

# copy the website files to the Nginx folder

COPY . /usr/share/nginx/html

# Expose port 80 for the web server

EXPOSE 80

# start nginx when the container runs

CMD ["nginx", "-g", "daemon off;"]
