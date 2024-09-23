FROM ubuntu:22.04

# Set maintainer information
LABEL maintainer="tan2018carlson@gmail.com"

# Update package lists and install necessary packages
RUN apt update -y && apt install -y nginx unzip curl

# Clear the default web directory
RUN rm -rf /var/www/html/*

# Download and unzip the template into the web directory
# ADD https://www.free-css.com/assets/files/free-css-templates/download/page283/ninom.zip /var/www/html
# RUN curl -o /var/www/html/ninom.zip https://www.free-css.com/assets/files/free-css-templates/download/page283/ninom.zip
RUN curl -o /var/www/html/antique-cafe.zip https://www.free-css.com/assets/files/free-css-templates/download/page295/antique-cafe.zip
WORKDIR /var/www/html/
RUN unzip antique-cafe.zip

# Move the extracted files to the correct location
RUN cp -rvf 2126_antique_cafe/* . 

# Clean up unnecessary files
RUN rm -rf ninom.zip ninom-html

# Expose port 80
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]



# jijijij



# From ubuntu:22.04                      
# Maintainer tan2018carlson@gmail.com
# RUN apt update -y && apt install nginx -y unzip curl
# RUN rm -rf /var/www/html/*   
# RUN apt install unzip -y
# RUN curl -o /var/www/html/maria-ferrero.zip https://www.free-css.com/assets/files/free-css-templates/download/page290/maria-ferrero.zip 
# WORKDIR /var/www/html
# RUN unzip maria-ferrero.zip
# RUN cp -rvf One-Page-Portfolio-Template-master/* .
# RUN rm -rf antique-cafe.zip 

# EXPOSE 80
# CMD ["nginx", "-g" , "daemon off;"]