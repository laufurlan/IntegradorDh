drop table if exists images;
drop table if exists attributes;
drop table if exists products_attributes;
drop table if exists products;
drop table if exists categories;
drop table if exists cities;
drop table if exists bookings;
drop table if exists users;
drop table if exists roles;


CREATE TABLE if not exists categories (
                                          id int NOT NULL auto_increment,
                                          title varchar(45) NOT NULL,
    description varchar(45) NOT NULL,
    url_image varchar(255),
    primary key(id));

CREATE TABLE if not exists cities (
                                      id_city int primary key NOT NULL auto_increment,
                                      title varchar(45) NOT NULL,
    state varchar(45),
    country varchar(45));


CREATE TABLE if not exists roles (
                                     id_role int primary key NOT NULL auto_increment,
                                     title varchar(45) NOT NULL);

CREATE TABLE if not exists users (
                                     id_user int primary key NOT NULL auto_increment,
                                     name varchar(45) NOT NULL,
    last_name varchar(50),
    email varchar(59),
    password varchar(70) not null,
    id_role int,
    FOREIGN KEY (id_role) REFERENCES roles(id_role));



CREATE TABLE if not exists products (
                                        id_product int primary key NOT NULL auto_increment,
                                        title varchar(50) NOT NULL,
    id_category int NOT NULL ,
    id_city int not null,
    url_main_image varchar(400),
    description varchar(400),
    address varchar(50),
    id_user_owner int,
    FOREIGN KEY (id_category) REFERENCES categories(id),
    FOREIGN KEY (id_user_owner) REFERENCES users(id_user),
    FOREIGN KEY (id_city) REFERENCES cities(id_city));



CREATE table if not exists bookings(
                                       id_booking int not null primary key auto_increment,
                                       initial_date date,
                                       final_date date,
                                       id_user int,
                                       id_product int,
                                       FOREIGN KEY (id_user) REFERENCES users(id_user) on delete cascade,
    FOREIGN KEY (id_product) REFERENCES products(id_product) on delete cascade);



CREATE TABLE if not exists attributes (
                                          id_attribute int primary key NOT NULL auto_increment,
                                          title varchar(45) NOT NULL);

CREATE TABLE if not exists images (
                                      id_image int primary key NOT NULL auto_increment,
                                      title varchar(45) NOT NULL,
    URL varchar(400) NOT NULL,
    id_product int not null,
    FOREIGN KEY (id_product) REFERENCES products(id_product)on delete cascade);

CREATE TABLE if not exists products_attributes (
                                                   id_product int,
                                                   id_attribute int,
                                                   FOREIGN KEY (id_product) REFERENCES products(id_product) on delete cascade,
    FOREIGN KEY (id_attribute) REFERENCES attributes(id_attribute)on delete cascade);

CREATE TABLE if not exists products_users (
                                              id_product int,
                                              id_user int,
                                              FOREIGN KEY (id_product) REFERENCES products(id_product) on delete cascade,
    FOREIGN KEY (id_user) REFERENCES users(id_user)on delete cascade);

#ALTER TABLE bookings
#ADD CONSTRAINT unique_booking UNIQUE (initial_date, final_date,id_product);
   	#Agregando datos

       INSERT INTO categories
   	VALUES (default,'Hoteles', 'Alojamiento en hoteles','https://images.pexels.com/photos/164595/pexels-photo-164595.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2' ),
          (default,'Hostales', 'Alojamiento en hostales','https://images.pexels.com/photos/5137980/pexels-photo-5137980.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
          (default,'Apartamentos', 'Alojamiento en apartamentos','https://images.pexels.com/photos/813692/pexels-photo-813692.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
          (default,'Break and Brekfast', 'Alojamiento en break and Brekfast', 'https://images.pexels.com/photos/279746/pexels-photo-279746.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');


INSERT INTO cities
VALUES (default,"Buenos Aires","Buenos Aires","Argentina"),
       (default,"Bogotá","Cundinamarca","Colombia"),
       (default,"Azul","Buenos Aires","Argentina");


INSERT INTO roles
VALUES (default,"offerer"),
       (default,"client");

INSERT INTO users
VALUES (default,"Shakira","Mebarak","shakira@gmail.com","contraseñadeshakira",2),
       (default,"Martina","Stoessel","Tini@gmail.com","contraseñadetini",2),
       (default,"Juan","Reyes","Juan@gmail.com","contrasñadeJuani",1);

INSERT INTO products
VALUES (default,"Hermitage Hotel",1,1,"https://images.pexels.com/photos/2291624/pexels-photo-2291624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2","En el corazón de San Telmo, disfruta de un albergue inspirado en las pasiones de Buenos Aires. con 2 impresionantes piscinas, una en la terraza y otra al aire libre; habitaciones privadas (algu...","Direccion1",3),
       (default,"Selina Los Heroes Bogota",2,2,"https://images.pexels.com/photos/5439497/pexels-photo-5439497.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2","Si te alojas en Selina Los Heroes Bogota, en Bogotá (Chapinero), estarás a diez minutos a pie de Centro de alta tecnología y Centro comercial Unilago. Este albergue se encuentra a ...","Direccion2",3),
       (default,"Apartamentos Ddlux",3,1,"https://images.pexels.com/photos/1571460/pexels-photo-1571460.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2","Ubicación del establecimiento Si te alojas en Apartamentos Delux, en Buenos Aires (Palermo), estarás a 1 minutos a pie de Palermo Soho. Estos modernos apartamentos se encuentran cerca de Teatro Colón y Obelisco. Te sentirás como en tu propia casa...","Direccion3",3),
       (default,"Hotel Madero Buenos Aires",1,1,"https://images.pexels.com/photos/2290738/pexels-photo-2290738.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2","Localizado en el Barrio de Puerto Madero en Buenos Aires, el Hotel Madero se encuentra a 3 km del Obelisco, 20 minutos en coche de la Plaza de Mayo y a 32 km del Aeropuerto Internacional ...","Direccion4",3),
       (default,"Mansilla 3935 B&B",4,1,"https://images.pexels.com/photos/7045993/pexels-photo-7045993.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2","Mansilla 3935 B&B está localizado en Buenos Aires. Cuenta con wi-fi gratis en zonas comunes y tv en zonas comunes, además de aire acondicionado en zonas comunes.","Dirección5",3);


INSERT INTO attributes
VALUES (default,"Wifi"),
       (default,"pet friendly"),
       (default,"parking");

INSERT INTO products_attributes
VALUES (1,1),
       (2,1),
       (1,2);

INSERT INTO images
VALUES (default,"abc","url1",1),
       (default,"abc1","url2",1),
       (default,"abc1","url3",2);






INSERT INTO bookings
VALUES (default,convert("2021-08-19",date),convert("2021-09-19",date),1,1),
       (default,convert("2021-08-19",date),convert("2021-09-19",date),2,2),
       (default,convert("2021-04-19",date),convert("2021-05-19",date),1,1),
       (default,convert("2021-08-02",date),convert("2021-08-18",date),1,1);

INSERT INTO products_users
VALUES (1,2),
       (1,3);




