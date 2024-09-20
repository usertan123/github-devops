From ubuntu:latest                      
Maintainer tan2018carlson@gmail.com
RUN apt update -y && apt install nginx -y 
RUN rm -rf /var/www/html/*   
RUN apt install unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page295/antique-cafe.zip /var/www/html
WORKDIR /var/www/html
RUN unzip antique-cafe.zip
RUN cp -rvf 2126_antique_cafe/* .
RUN rm -rf antique-cafe.zip 

EXPOSE 80
CMD ["nginx", "-g" , "daemon off;"]


# jijijij



# From ubuntu:latest                      
# Maintainer tan2018carlson@gmail.com
# RUN apt update -y && apt install nginx -y 
# RUN rm -rf /var/www/html/*   
# RUN apt install unzip -y
# ADD https://www.free-css.com/assets/files/free-css-templates/download/page290/maria-ferrero.zip /var/www/html
# WORKDIR /var/www/html
# RUN unzip maria-ferrero.zip
# RUN cp -rvf One-Page-Portfolio-Template-master/* .
# RUN rm -rf antique-cafe.zip 

# EXPOSE 80
# CMD ["nginx", "-g" , "daemon off;"]