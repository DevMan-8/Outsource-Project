FROM nginx:latest
COPY nginx.conf /etc/nginx/conf.d/default.conf
WORKDIR /var/www/html
COPY index.html //var/www/html