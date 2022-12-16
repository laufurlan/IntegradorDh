drop schema if exists Hotels;
create database Hotels;
use Hotels;


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
    description varchar(5000),
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
    						FOREIGN KEY (id_attribute) REFERENCES attributes(id_attribute)on delete cascade,
	  					 primary key(id_product,id_attribute));

CREATE TABLE if not exists products_users (
                                              id_product int,
                                              id_user int,
                                              FOREIGN KEY (id_product) REFERENCES products(id_product) on delete cascade,
    FOREIGN KEY (id_user) REFERENCES users(id_user)on delete cascade);

#ALTER TABLE bookings
#ADD CONSTRAINT unique_booking UNIQUE (initial_date, final_date,id_product);
   	#Agregando datos

        INSERT INTO categories
   	VALUES (default,'Hoteles', 'Alojamiento en hoteles','https://s3-images-g4c6.s3.us-east-2.amazonaws.com/categories/1_Hoteles.jpg' ),
          (default,'Hostales', 'Alojamiento en hostales','https://s3-images-g4c6.s3.us-east-2.amazonaws.com/categories/2_Hostales.jpeg'),
          (default,'Apartamentos','Alojamiento en Apartamentos','https://s3-images-g4c6.s3.us-east-2.amazonaws.com/categories/3_Apartamentos.jpeg'),
          (default,'Break and Brekfast', 'Alojamiento en break and Brekfast', 'https://s3-images-g4c6.s3.us-east-2.amazonaws.com/categories/4_Break+and+Brekfast.jpg');

INSERT INTO cities
   	VALUES (default,"Buenos Aires","Buenos Aires","Argentina"),
   	 	(default,"Bogotá","Cundinamarca","Colombia"),
        (default,"Rosario","Santa Fe","Argentina"),
        (default,"San Carlos de Bariloche","Rio Negro","Argentina"),
        (default,"Ciudad de Cordoba","Cordoba","Argentina"),
        (default,"Villa General Belgrano","Cordoba","Argentina"),
        (default,"San Rafael","Mendoza","Argentina"),
        (default,"Posadas","Misiones","Argentina"),
        (default,"Puerto Iguazu","Misiones","Argentina"),
        (default,"Ushuaia","Tierra del Fuego","Argentina"),
        (default,"Calafate","Santa Cruz","Argentina"),
        (default,"Mar del Plata","Buenos Aires","Argentina"),
         (default,"San Andres","San Andres","Colombia"),
         (default,"Medellin","Antioquia","Colombia"),
         (default,"Barranquilla","Atlantico","Colombia"),
         (default,"Cali","Valle del Cauca","Colombia"),
         (default,"Cartagena","Caiman","Colombia"),
         (default,"Santa Marta","Magdalena","Colombia"),
         (default,"Riohacha","La Guajira","Colombia"),
          (default,"São Paulo","Estado de São Paulo","Brasil"),
          (default,"Rio de Janeiro","Estado de Rio de Janeiro","Brasil"),
           (default,"Doha","Estado de Qatar​","Qatar");
          


INSERT INTO roles
VALUES (default,"offerer"),
       (default,"client");

     INSERT INTO users
   	 VALUES (default,"Shakira","Mebarak","shakira@gmail.com","$2a$10$MIy8H3GOeUY7hMNs0OW59uKnpi6Fl0FvxJTZkBNG/C8TlEv7GkL/e",2),
		(default,"Martina","Stoessel","Tini@gmail.com","$2a$10$iPke02OwD.fORcqHl8POHOa294YlL0pj550FyAxel/qneReHqpPrK",2),
        	(default,"Juan","Reyes","Juan@gmail.com","$2a$10$NMyl99fUF1dcePP.taB6dOq0yRi.SiJiglBIchxHtkEGWp9xt673m",1);

 INSERT INTO products
	 VALUES (default,"Hermitage Hotel",1,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/1_Hermitage+Hotel.jpeg","Está situado a solo unas calles de la avenida Alvear, de la avenida Quintana, del parque San Martín y del distrito de Recoleta. En las inmediaciones también hay varios lugares de interés, como la calle Florida, el centro comercial Galerías Pacífico, la zona de Puerto Madero, la plaza de Mayo y el palacio Municipal.

Nuestros clientes dicen que esta parte de Buenos Aires es su favorita, según los comentarios independientes.

El Hotel es un hotel sofisticado de 4 estrellas que goza de una ubicación tranquila, a poca distancia de prestigiosas galerías de arte, teatros, museos y zonas comerciales. Además, hay WiFi gratuita.
El establecimiento sirve un desayuno variado de 07:00 a 10:30.

","Direccion1",3),
(default,"Dazzler by Wyndham Polo",1,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/2_Dazzler+by+Wyndham+Polo.jpg","El Dazzler by Wyndham Polo se encuentra en el barrio de Palermo, en Buenos Aires, a 1 km del Campo Argentino de Polo y del Jardín Botánico, a 800 m del Centro de Exposiciones La Rural y a 2 km del centro comercial Alto Palermo Shopping. Dispone de terraza, solárium, gimnasio y Wi-Fi gratuito.

Las habitaciones están equipadas con aire acondicionado, TV LED, minibar y baño privado con secador de pelo. Las categorías difieren en tamaño y las suites, además, poseen zona de estar independiente con sofá y 2 TVs LED de 40”.

Entre las comodidades del Dazzler by Wyndham Polo encontrará recepción 24h, servicio de conserjería y el ofrecimiento de traslados, lavandería y tintorería por un cargo extra. Hay convenio para solicitar estacionamiento por un cargo extra, a un lado del hotel.

Todas las mañanas se sirve desayuno, con medialunas, jugos, yogures y frutas. Si desea cenar afuera podrá ir a los bares y restaurantes de Las Cañitas, a 1 km, y de Plaza Serrano, a 2 km del establecimiento.

La propiedad se sitúa a 4 km del Aeropuerto Internacional Jorge Newbery. El Rosedal queda a 1.5 km y la Embajada de Estados Unidos, a 600 m","Direccion2",3), 

(default,"Hotel Madero Buenos Aires",1,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/3_Hotel+Madero+Buenos+Aires.jpg","Localizado en el Barrio de Puerto Madero en Buenos Aires, el Hotel Madero se encuentra a 3 km del Obelisco, 20 minutos en coche de la Plaza de Mayo y a 32 km del Aeropuerto Internacional Ministro Pistarini de Ezeiza. La propiedad ofrece internet Wi-Fi gratis y desayuno de cortesía.

Entre los servicios disponibles se encuentran piscina cubierta, spa y gimnasio, así como salas de reuniones y estacionamiento con cargo adicional.

El Red Resto & Lounge ofrece una carta de cocina regional y experimental, cuenta con una cava de vino y un sommelier que asesorará a los huéspedes. El desayuno tipo buffet es servido a diario.

Hotel Madero se localiza a 100 m de los restaurantes de Puerto Madero, el barrio San Telmo está a 1 km y el Aeroparque Internacional Jorge Newbery a 10 km.","Direccion3",3),

(default,"Huinid Obelisco Hotel",1,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/4_Huinid+Obelisco+Hotel.jpg","Huinid Obelisco Hotel se sitúa en Buenos Aires. Dispone de wi-fi gratis en zonas comunes, bañera / tina de hidromasaje y gimnasio, así como recepción 24 hrs.

Necesitas saber:
• Accesible para personas con movilidad reducida
• Unidades adaptadas a personas con movilidad reducida
• Mascotas: no se admiten
• Propiedad libre de humo

El alojamiento sirve diariamente el desayuno, el cual se ofrece en el restaurante. También dispone de bar y cafetería.

Entre las comodidades se destacan computadora para huéspedes, solárium, ascensor y toallas. Los huéspedes también podrán disfrutar de sábanas. Por un suplemento, la propiedad cuenta con estacionamiento limitado y servicio de lavandería.","Direccion4",3),
(default,"Cyan Américas Towers Hotel",1,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/5_Cyan+Am%C3%83%C2%A9ricas+Towers+Hotel.jpg","El Cyan Américas Towers Hotel está ubicado en el barrio de Recoleta, en Buenos Aires, a 100 m de la Avenida 9 de Julio. Dispone de desayuno, piscina de temporada con solarium y Wi-Fi gratis.

Brújula:
• Ubicado a 1,5 km del Cementerio de la Recoleta y Galerías Pacífico.
• A 15 minutos a pie del Teatro Colón y del Obelisco.
• El Cyan Américas Towers Buenos Aires queda a 2,5 km de Puerto Madero.
• El Aeropuerto Internacional Jorge Newbery se encuentra a 7 km.
• A 20 minutos en coche de la Plaza Dorrego, en el barrio de San Telmo.","Direccion4",3),
            (default,"HTL 9 de Julio Bs As",1,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/6_HTL+9+de+Julio+Bs+As.jpg","El HTL 9 de Julio ofrece lofts con microondas y un pequeño refrigerador, a 10 m de la Avenida 9 de Julio y a 900 m del Obelisco, en Buenos Aires. Con desayuno servido en la habitación, se sitúa a 10 minutos a pie de la calle peatonal Florida y la Plaza de Mayo.

Necesitas saber:
• Se ofrecen traslados y estacionamiento externo, a 200 m por un suplemento.

Para el desayuno buffet se puede elegir entre infusiones calientes, panificados, pastelería y yogur, además de fiambres.

Brújula:
• Los huéspedes del HTL 9 de Julio se encontrarán a 600 m del histórico Café Tortoni.
• A 1 km del Teatro Colón.
• A 1.5 km de Puerto Madero y San Telmo.
• En bus, el Cementerio de la Recoleta queda a 20 minutos.
• El Aeroparque Internacional Jorge Newbery está a 20 minutos en auto.","Direccion5",3),
(default,"HTL City Baires",1,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/7_HTL+City+Baires.jpg","HTL City Baires se sitúa en Buenos Aires, a 500 m de Casa Rosada, a 750 m de Puerto Madero y a 1 km del Mercado de San Telmo. Ofrece Wi-Fi gratis.

Las habitaciones cuentan con TV por cable y baño privado con bañera.

Entre los servicios de la propiedad se encuentran estacionamiento con costo extra sujeto a disponibilidad, recepción 24hs y servicio de consejería, así como servicio de lavandería y planchado, ambas con costo adicional.

La Terminal de Buses de Retiro se encuentra a 3,5 km de la propiedad y el ​Aeropuerto Internacional de Ezeiza, a 31 km.","Direccion6",3),
            (default,"Savoy Hotel",1,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/8_Savoy+Hotel.jpg","Con arquitectura de estilo neobarroco, El Savoy Hotel está ubicado en Buenos Aires, a 500 m de la zona de teatros y restaurantes de la Avenida Corrientes, a 20 minutos a pie del Obelisco y a 1.5 km del Teatro Colón. Se encuentra a 300 m de la estación Callao de la línea B, que conecta con Puerto Madero y el distrito financiero en 10 minutos y a 400 m de la estación Congreso de la línea A, que llega al Café Tortoni, la Plaza de Mayo y la peatonal Florida en el mismo tiempo. El Aeroparque Internacional Jorge Newbery está a 7.5 km del hotel, que dispone de Wi-Fi gratuito.

El desayuno buffet, es de estilo americano e incluye infusiones calientes, jugos, tostadas y medialunas, además de frutas, cereales, yogur y budines. También cuenta con variedad de quesos y fiambres, huevos revueltos, arroz y vegetales salteados. Se ofrecen productos orgánicos de bajas calorías. Todas las tardes, en el lobby-bar Imperio, se puede degustar el Té de las 5, que incluye copa de vino espumante, selección de tés, café y jugo, además de mini-sandwiches, tarteletas frutales y escones. En el bar también se sirven aperitivos, tapas y cocteles. El Restaurante Las Manzanas ofrece carta de vinos y cocina moderna de autor con evocaciones de la gastronomía francesa. Para el almuerzo, se puede optar por un buffet ejecutivo mediterráneo.

Las habitaciones están equipadas con TV LCD 32” con cable, aire acondicionado y calefacción con control individual, escritorio y vestidor, además de minibar y teléfono. El baño incluye secador de cabello, box de ducha o bañera sujeta a disponibilidad, amenidades y espejo de vanidad. Algunas unidades cuentan con bata, pantuflas y amenidades diferenciadas. Otras categorías permiten acceso a un espacio VIP, con infusiones calientes, bollería dulce, salas de estar y pantallas LCD.

El establecimiento tiene centro de negocios con escritorio, computadoras e impresora, 11 salas de reuniones y servicio de conserjería. En el entrepiso del hotel, se puede utilizar el gimnasio 24h y reservar salas de masajes, además de estacionamiento externo a 50 m por un cargo extra.

Por medio del ómnibus, se puede llegar en 15 minutos al Cementerio de la Recoleta, en 25 minutos a San Telmo, en 30 minutos al Jardín Japonés y en 40 minutos a Caminito. El Aeropuerto Internacional de Ezeiza – Ministro Pistarini se encuentra a 30.5 km del hotel.","Direccion7",3),
            (default,"Regal Pacific Puerto Madero",1,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/9_Regal+Pacific+Puerto+Madero.jpg","El Hotel Regal Pacific Puerto Madero está ubicado en el barrio de Retiro, en Buenos Aires, a 5 minutos caminando de los restaurantes de Puerto Madero y de la zona empresarial de Catalinas, a 500 m de la calle Florida y Galerías Pacífico y a 1.5 km del Obelisco. Ofrece habitaciones de 38 m² y recepción 24h con personal idóneo para brindar asistencia.

Necesitas saber:
• Los huéspedes dicen que el desayuno es muy variado.
• El estacionamiento es gratuito, sujeto a disponibilidad.
• Hay cunas gratis, sujetas a disponibilidad.

El desayuno buffet americano, que está incluido en algunas tarifas, cuenta con estación de frutas y cereales, fiambres y pastelería, así como platos calientes. En el Restaurante Ébano se sirve cocina contemporánea y en el Sommelier Lounge, degustará vinos y cocteles, acompañados por quesos y postres.

Brujula:
• El Teatro Colon, la Plaza de mayo y los teatros de Avenida Corrientes se encuentra a 15 minutos caminando
• El Aeroparque Internacional Jorge Newbery está a 7.5 km
• El Aeropuerto Internacional de Ezeiza se encuentra a 34 km.
eiza, a 34 km.","Direccion8",3),(default,"Dazzler by Wyndham Palermo",1,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/10_Dazzler+by+Wyndham+Palermo.jpg","Rodeado de bares y restaurantes en el barrio de Palermo Hollywood, el Dazzler by Wyndham Palermo se encuentra a 700 m de Plaza Serrano y a 1.5 km de la Estación de Metro Palermo. El Aeroparque Internacional Jorge Newbery queda a 7 km de la propiedad, que dispone de terraza con vista panorámica y conexión Wi-Fi gratuita en todas sus instalaciones.

Todas las habitaciones están equipadas con aire acondicionado con control individual, TV LCD de 42” por cable, minibar y escritorio, además de caja fuerte y ventanas con aislamiento acústico. Los baños cuentan con bañera, secador de cabello y artículos de aseo.

En el último piso del Dazzler by Wyndham Palermo se ofrece un desayuno buffet que consiste en infusiones calientes, variedad de panes y medialunas, además de jamón y queso, huevos revueltos y frutas. Los huéspedes pueden solicitar servicio de habitación para el almuerzo y la cena.

Las comodidades que incluye son estacionamiento por un costo adicional, gimnasio y servicio de traslado por un cargo extra. La recepción del hotel está disponible las 24h y ofrece información turística de la ciudad, además de depósito de equipaje gratuitamente.

El Dazzler by Wyndham Palermo está ubicado a 600 m de las tiendas de indumentaria outlet de la Avenida Córdoba y a 20 minutos en auto del Cementerio de la Recoleta. El Aeropuerto Internacional de Ezeiza – Ministro Pistarini se halla a 30 km del establecimiento.","Direccion10",3),
            (default,"Dazzler by Wyndham Recoleta",1,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/11_Dazzler+by+Wyndham+Recoleta.jpg","Situado en el barrio de Recoleta, en Buenos Aires, el Dazzler by Wyndham Recoleta ofrece habitaciones equipadas con Wi-Fi grátis.

Necesitas saber:
• Algunos huéspedes consideran que el baño podría ser mejor.

En el comedor del Dazzler by Wyndham Recoleta se ofrece un desayuno buffet diariamente que consiste en frutas, cereales, pastelería y panes, además de medialunas, fiambres y una selección de bebidas. Los huéspedes también disponen de servicio a la habitación.

Brújula:
• A 400 m del Cementerio de la Recoleta.
• El Dazzler by Wyndham Recoleta se halla a 1 km de la Estación de Metro Pueyrredón, que conecta con el Obelisco en 10 minutos y con la Peatonal Florida en 15 minutos.
• A 10 minutos a pie de Plaza Francia.
• El Aeroparque Internacional Jorge Newbery queda a 7 km de la propiedad.
• El Aeropuerto Internacional de Ezeiza – Ministro Pistarini queda a 33 km del hotel.","Direccion11",3),
(default,"Che Juan Hostel BA",2,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/12_Che+Juan+Hostel+BA.jpg","Che Juan Hostel BA está localizado en Buenos Aires. Ofrece wi-fi gratis en zonas comunes, salón de juegos y recepción 24 hrs, así como venta de entradas.

Necesitas saber:
• Mascotas: no se admiten
• Caja fuerte en la recepción
• Propiedad libre de humo

El alojamiento ofrece todos los días el desayuno con costo adicional. Los huéspedes podrán cocinar en la comodidad de su alojamiento, en su asador.

Las comodidades incluyen biblioteca, tv en zonas comunes, ascensor y servicio de conserjería Por un costo adicional, la propiedad cuenta con servicio de guarda-equipaje y servicio de lavandería.","Direccion12",3),
            (default,"Franca City Hostel",2,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/13_Franca+City+Hostel.jpg","Franca City Hostel está localizado en Buenos Aires. Cuenta con wi-fi gratis en zonas comunes, servicio de masajes y recepción 24 hrs, además de información turística.

Necesitas saber:
• Check-in y check-out express
• Mascotas: no se admiten
• Caja fuerte en la recepción
• Propiedad libre de humo

El establecimiento posee un bar donde podrás degustar las especialidades de la casa. También es posible disfrutar de su snack bar. El personal de la propiedad proporcionará servicio a la habitación. Los huéspedes podrán cocinar en la comodidad de su alojamiento, en su cocina compartida.

Las comodidades incluyen venta de entradas, sala de reuniones, biblioteca y tv en zonas comunes. Los huéspedes también podrán disfrutar de seguridad 24 hrs y toallas. Por un costo adicional, la propiedad cuenta con servicio de traslado al aeropuerto, servicio de guarda-equipaje y servicio de lavandería.","Direccion13",3),
            (default,"Palermo Soho Hostel",2,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/14_Palermo+Soho+Hostel.jpg","Si decides alojarte en Palermo Soho Hostel, te encontrarás en una fantástica zona de Buenos Aires (Palermo), a solo unos pasos de Palermo Soho y a apenas 12 min a pie de Plaza Italia. Además, este albergue se encuentra a 9,8 km de Teatro Colón y a 10,1 km de Obelisco.
Este albergue dispone de espacios para fumadores.
Tendrás un servicio de recepción las 24 horas, consigna de equipaje y una lavandería a tu disposición.
Se ofrece un desayuno bufé gratuito todos los días de 8:00 a 10:00.
Te sentirás como en tu propia casa en cualquiera de las 14 habitaciones. Mantén el contacto con los tuyos gracias a la conexión a Internet wifi gratis. El cuarto de baño está provisto de ducha. Entre las comodidades, se incluyen tabla de planchar con plancha, además de un servicio de limpieza disponible todos los días.","Direccion14",3),
            (default,"Ba Stop Buenos Aires Hostel",2,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/15_Ba+Stop+Buenos+Aires+Hostel.jpg","Sobre Ba Stop Buenos Aires Hostel
Ba Stop Buenos Aires Hostel está localizado en Buenos Aires. Cuenta con wi-fi gratis en zonas comunes, salón de juegos y venta de entradas, así como computadora para huéspedes.

Necesitas saber:
• Acceso a unidades por escaleras
• Check-in y check-out express
• Mascotas: no se admiten
• Caja fuerte en la recepción

Entre los servicios de la propiedad se encuentran biblioteca, terraza, tv en zonas comunes y recepción con horario limitado. Los huéspedes también podrán disfrutar de servicio de conserjería. Por un costo adicional, la propiedad cuenta con servicio de traslado al aeropuerto, servicio de guarda-equipaje y servicio de lavandería.","Direccion17",3),
 (default,"Master Hostel Borges",2,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/16_Master+Hostel+Borges.jpg","Ubicación del establecimiento Si te alojas en Master Hostel Borges, en Buenos Aires (Palermo), estarás a 1 minutos a pie de Palermo Soho. Este albergue se encuentra cerca de Teatro Colón y Obelisco. Habitaciones Te sentirás como en tu propia casa en una de las 20 habitaciones con frigorífico y televisor LED. Prepare sus comidas en la cocina compartida / comunitaria. Televisión por cable se proporciona para su entretenimiento. Los baños disponen de ducha, artículos de higiene personal gratuitos y secador de pelo. Servicios Disfruta de las vistas desde una terraza y aprovecha servicios como conexión a Internet wifi gratis y televisor en zonas comunes.Para comer Todos los días se sirve un desayuno estilo bufé gratuito. 10 AM.Servicios de negocios y otros Entre los servicios adicionales figuran una zona de ordenadores, servicio de recepción 24 horas y microondas en las zonas comunes. El check-in comienza a las 2 PM Hora de salida es 10 AM","Direccion19",3),
            (default,"Art Factory Hostel San Telmo",2,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/17_Art+Factory+Hostel+San+Telmo.jpg","Art Factory Hostel San Telmo está localizado en Buenos Aires. Cuenta con wi-fi gratis en zonas comunes y venta de entradas, así como terraza.

Necesitas saber:
• Alojamiento / hospedaje solo para adultos
• Mascotas: no se admiten
• Propiedad libre de humo

Los huéspedes podrán cocinar en la comodidad de su alojamiento, en su asador.

Las comodidades incluyen recepción con horario limitado y servicio de conserjería. Por un costo adicional, la propiedad cuenta con servicio de traslado al aeropuerto, bicicletas disponibles y servicio de guarda-equipaje.","Direccion20",3),
            (default,"America Del Sur Hostel",2,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/18_America+Del+Sur+Hostel.jpg","America Del Sur Hostel se sitúa en Buenos Aires. Cuenta con wi-fi gratis en zonas comunes, recepción 24 hrs y venta de entradas, además de biblioteca.

Necesitas saber:
• Unidades adaptadas a personas con movilidad reducida
• Mascotas: no se admiten
• Zona de fumadores

El alojamiento ofrece todos los días el desayuno con costo adicional. Los huéspedes podrán cocinar en la comodidad de su alojamiento, en su asador.

Entre las comodidades se destacan zona de picnic, tv en zonas comunes, ascensor y servicio de conserjería Por un costo adicional, la propiedad cuenta con servicio de guarda-equipaje.","Direccion21",3),
            (default,"Casa Franca Recoleta Hostel",2,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/19_Casa+Franca+Recoleta+Hostel.jpg","En Buenos Aires (Recoleta), Casa Franca Recoleta Hostel, en la zona de Recoleta, en Buenos Aires, se encuentra a 10 minutos en auto de Obelisco y Plaza San Martín. Hospédate en este hostel y estarás a 1,4 km de Avenida 9 de Julio, así como a 2,4 km de Teatro Colón. Te sentirás como en tu propia casa en una de las 10 habitaciones con aire acondicionado y estación para iPod. Las camas cuentan con colchones un colchón Select Comfort y cubrecama para descansar plácidamente. Mantén el contacto con los tuyos gracias al acceso a internet por wifi de cortesía. El cuarto de baño dispone de ducha. Este hostel pone a tu disposición una cafetería para que comas un snack u otra cosa ligera. Disfruta de tu bebida favorita en el Bar. Aprovecha los prácticos servicios que se te ofrecen, como acceso a internet por wifi gratuito o servicios de concierge. Tendrás servicio de recepción las 24 horas, resguardo de equipaje y ascensor a tu disposición.","Direccion22",3),
            (default,"DEL900 Hostel Boutique",2,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/20_DEL900+Hostel+Boutique.jpg","DEL900 Hostel Boutique se sitúa en Buenos Aires. Cuenta con wi-fi gratis en zonas comunes.

El alojamiento sirve diariamente el desayuno con costo adicional, el cual se ofrece en el bar. Los huéspedes podrán cocinar en la comodidad de su alojamiento, en su asador.

Entre los servicios de la propiedad se encuentran recepción con horario limitado y servicio de conserjería. Por un costo adicional, la propiedad cuenta con servicio de traslado al aeropuerto y servicio de lavandería.","Direccion23",3),
(default,"La Maison Hostel Boutique",2,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/21_La+Maison+Hostel+Boutique.jpg","A poca distancia de Teatro Colón, La Maison Hostel Boutique, en la zona de Recoleta, en Buenos Aires, se encuentra a 15 minutos a pie de Teatro Colón y Calle Florida. Hospédate en este hostel y estarás a 1,4 km de Obelisco, así como a 1,6 km de Plaza San Martín. Te sentirás como en tu propia casa en una de las 8 habitaciones. Mantén el contacto con los tuyos gracias al acceso a internet por wifi de cortesía. El cuarto de baño dispone de ducha. Tendrás resguardo de equipaje, caja de seguridad en la recepción y microondas en las áreas comunes a tu disposición.","Direccion30",3),
            (default,"CH Recoleta Suites",3,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/22_CH+Recoleta+Suites.jpg","El CH Recoleta Suites es un complejo de departamentos situado en el barrio de la Recoleta, en Buenos Aires. Ofrece Wi-Fi gratuito y recepción disponible las 24 horas.

Los apartamentos tienen 40 m², están climatizados y cuentan con cocina equipada, TV LCD por cable, Wi-Fi gratis y bañera. Hay unidades con 55 m² y sala de estar y algunas cuentan con vistas al barrio y al Cementerio de la Recoleta, principal punto turístico de la región.

Además, podrá disfrutar de:

• Ascensor
• Servicio de lavandería, con cargo adicional
• Traslado con cargo extra

El establecimiento dispone de desayuno, con cargo extra. La propiedad se encuentra en una zona con variedad de restaurantes y bares.

Conozca los puntos de interés más cercanos:
 
• El mercado de artesanía de Plaza Francia está a 400 m.
• El Recoleta Mall está a sólo 100 m.
• A 5 minutos a pie se encuentra el Centro Cultural Recoleta.
• El Teatro Colón está a 2 km.
• El Obelisco y los bosques de Palermo se sitúan a 2,5 km.
• El Aeroparque Internacional Jorge Newbery está a 20 minutos en coche.

Nuestros huéspedes recomiendan el CH Recoleta Suites por su ubicación, por la relación costo-beneficio y por la atención de los empleados.","Direccion24",3),
            (default,"Dreaming Uriarte",3,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/23_Dreaming+Uriarte.jpg","Dreaming Uriarte se sitúa en Buenos Aires. Ofrece internet por cable gratis en zonas comunes y ascensor, además de toallas.

Necesitas saber:
• Accesible para personas con movilidad reducida
• Unidades adaptadas a personas con movilidad reducida
• Mascotas: no se admiten

Las comodidades incluyen sábanas, recepción con horario limitado y aire acondicionado en zonas comunes. Por un cargo, la propiedad cuenta con servicio de traslado al aeropuerto.","Direccion24",3),
            (default,"La Casona del Alma",3,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/24_La+Casona+del+Alma.jpg","La Casona del Alma se encuentra en Buenos Aires. Cuenta con wi-fi gratis en zonas comunes, servicio de cambio de moneda y jardín, además de solárium.

Necesitas saber:
• Mascotas: no se admiten

Las comodidades incluyen toallas, sábanas, aire acondicionado en zonas comunes y calefacción en zonas comunes Por un cargo, la propiedad cuenta con servicio de traslado al aeropuerto.","Direccion44",3),
 (default,"Paraguay 716",3,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/25_Paraguay+716.jpg","Paraguay 716 está localizado en Buenos Aires. Dispone de wi-fi gratis en zonas comunes, recepción 24 hrs y servicio de guarda-equipaje gratis, además de solárium.

Necesitas saber:
• Mascotas: no se admiten

El personal de la propiedad proporcionará servicio a la habitación.

Entre las comodidades se destacan seguridad 24 hrs, ascensor, lockers y toallas. Los huéspedes también podrán disfrutar de sábanas y aire acondicionado en zonas comunes. Por un cargo, la propiedad cuenta con servicio de lavandería.","Direccion25",3),
            (default,"Lopez Hostel & Suites",4,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/26_Lopez+Hostel+%26+Suites.jpg","Lopez Hostel & Suites está localizado en Buenos Aires. Dispone de wi-fi gratis en zonas comunes, venta de entradas y biblioteca, así como zona de picnic.

Necesitas saber:
• Alojamiento / hospedaje solo para adultos
• Mascotas: no se admiten
• Zona de fumadores

Los huéspedes podrán cocinar en la comodidad de su alojamiento, en su asador.

Entre las comodidades se destacan terraza, jardín, tv en zonas comunes y recepción con horario limitado. Los huéspedes también podrán disfrutar de servicio de conserjería. Por un costo adicional, la propiedad cuenta con servicio de traslado al aeropuerto, servicio de guarda-equipaje y servicio de lavandería.","Direccion26",3),
            (default,"Art Factory Soho",4,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/27_Art+Factory+Soho.jpg","Art Factory Soho está localizado en Buenos Aires. Dispone de wi-fi gratis en zonas comunes.

Necesitas saber:
• Acceso a unidades por escaleras
• Mascotas: no se admiten

Entre los servicios de la propiedad se encuentran venta de entradas y servicio de conserjería. Por un cargo, la propiedad cuenta con servicio de traslado al aeropuerto, servicio de guarda-equipaje y toallas y sábanas.","Direccion26",3),
            (default,"Sobre Mansilla 3935 B&B",4,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/28_Sobre+Mansilla+3935+B%26B.jpg","Mansilla 3935 B&B está localizado en Buenos Aires. Cuenta con wi-fi gratis en zonas comunes y tv en zonas comunes, además de aire acondicionado en zonas comunes.

Entre las comodidades se destacan calefacción en zonas comunes y servicio de despertador.","Direccion27",3),
            (default,"La cascada Townhouse Hotel",4,1,"https://s3-images-g4c6.s3.us-east-2.amazonaws.com/products/29_La+cascada+Townhouse+Hotel.jpg","La cascada Townhouse Hotel se encuentra en Buenos Aires. Dispone de wi-fi gratis en zonas comunes, servicio de guarda-equipaje gratis y jardín, así como seguridad 24 hrs.

Necesitas saber:
• Alojamiento / hospedaje solo para adultos
• Accesible para personas con movilidad reducida

El alojamiento ofrece todos los días el desayuno.

Entre los servicios de la propiedad se encuentran toallas, sábanas, aire acondicionado en zonas comunes y calefacción en zonas comunes. Los huéspedes también podrán disfrutar de servicio de despertador. Por un cargo, la propiedad cuenta con estacionamiento limitado.","Direccion29",3);
			
         INSERT INTO attributes
	 VALUES (default,"Cocina"),
            (default,"Televisor"),
            (default,"Aire Acondicionado"),
            (default,"Apto mascotas"),
            (default,"Estacionamiento"),
            (default,"Pileta"),
            (default,"Wifi"),
            (default,"Gimnasio"),
            (default,"Mini Bar");
            
INSERT INTO products_attributes
VALUES (1,1),
       (2,1),
       (1,2);

INSERT INTO images
	 VALUES (default,"abc1","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/1_Room1.jpg",1),
            (default,"Room1","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/2_Pool1.jpg",1),
            (default,"Buffet1","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/3_Buffet1.jpg",1),
            (default,"Lobby1","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/4_Lobby1.jpg",1),
            (default,"Lobby2","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/5_Lobby2.jpg",2),
            (default,"Room2","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/6_Room2.jpg",2),
            (default,"Pool2","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/7_Pool2.jpg",2),
            (default,"Buffet2","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/8_Buffet2.jpg",2),
            (default,"Lobby3","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/9_Lobby3.jpg",3),
            (default,"Room3","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/10_Room3.jpg",3),
            (default,"Pool3","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/11_Pool3.jpg",3),
            (default,"Buffet3","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/12_Pool3.jpg",3),
            (default,"Lobby4","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/13_Lobby4.jpg",4),
            (default,"Room4","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/14_Room4.jpg",4),
            (default,"Pool4","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/15_Pool4.jpg",4),
            (default,"Buffet5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/16_Buffet5.jpg",5),
            (default,"Lobby5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/17_Lobby5.jpg",5),
            (default,"Room5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/18_Room5.jpg",5),
			 (default,"Pool5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/19_Pool5.jpg",5),
            (default,"Buffet5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/20_Buffet5.jpg",5),
             (default,"Lobby6","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/21_Lobby6.jpg",6),
            (default,"Room6","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/22_Room6.jpg",6),
            (default,"LivingRoom6","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/23_LivingRoom6.jpg",6),
            (default,"Buffet6","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/24_Buffet6.jpg",6),
             (default,"Lobby7","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/25_Lobby6.jpg",7),
            (default,"Room7","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/26_Room7.jpg",7),
            (default,"Room7_1","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/27_Room7.jpg",7),
			(default,"Lobby7","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/28_Lobby7.jpg",7),
             (default,"Lobby8","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/29_Lobby7.jpg",8),
            (default,"Room5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/30_Room8.jpg",8),
            (default,"Lobby5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/31_Lobby8.jpg",8),
			(default,"Buffet5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/32_Buffet8.jpg",8),
            (default,"Lobby5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/33_Lobby8.jpg",9),
            (default,"Room5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/34_Room_9.jpg",9),
            (default,"Room9","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/35_Room_9.jpg",9),
			(default,"Buffet9","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/36_Buffet9.jpg",9),
            (default,"Lobby10","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/37_Lobby_9.jpg",10),
            (default,"Room10","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/38_Room_10.jpg",10),
            (default,"Lobby10_1","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/39_Lobby_10.jpg",10),
			(default,"Buffet10","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/40_Buffet_10.jpg",10),
            (default,"Lobby11","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/41_Lobby_11.jpg",11),
            (default,"Room11","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/42_Room_11.jpg",11),
            (default,"Pool11","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/43_Pool_11.jpg",11),
			(default,"Pool11_1","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/44_Pool_11.jpg",11),
            (default,"Lobby12","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/45_Lobby_12.jpg",12),
            (default,"Room12","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/46_Room_12.jpg",12),
            (default,"Room12_1","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/47_Room_12.jpg",12),
			(default,"Buffet12","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/48_Buffet_12.jpg",12),
            (default,"Buffet12_1","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/49_kitchen_13.jpg",13),
            (default,"Room5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/50_Lobby_13.jpg",13),
            (default,"Lobby_13","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/51_Lobby_13.jpg",13),
			(default,"Buffet13","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/52_Lobby_13.jpg",13),
            (default,"Room14","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/53_Lobby_14.jpg",14),
            (default,"Room14","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/54_Room_14.jpg",14),
            (default,"Room14_1","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/55_Room_14.jpg",14),
			(default,"Buffet14","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/56_Buffet14.jpg",14),
            (default,"Lobby15","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/57_Lobby_15.jpg",15),
            (default,"Room15","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/58_Room_15.jpg",15),
            (default,"Lobby15_1","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/59_Lobby_15.jpg",15),
			(default,"Room15","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/60_Room_15.jpg",15),
            (default,"Lobby5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/61_Lobby_16.jpg",16),
            (default,"Buffet16","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/62_Buffet_16.jpg",16),
            (default,"Kitchen16","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/63_Kitchen_16.jpg",16),
			(default,"Buffet5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/64_Buffet_16.jpg",16),
			(default,"Lobby5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/65_Lobby_17.jpg",17),
            (default,"Room5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/66_Room_17.jpg",17),
             (default,"Pool5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/67_Room_17.jpg",17),
			(default,"Buffet5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/68_Room_17.jpg",17),
            (default,"Room18","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/70_Lobby_18.jpg",18),
            (default,"Room_18_1","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/71_Room_18.jpg",18),
			(default,"Buffet5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/72_Buffet_18.jpg",18),
            (default,"Room19","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/73_Room_19.jpg",19),
            (default,"Room19_1","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/74_Buffet_19.jpg",19),
            (default,"Lobby_19","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/75_Bobby_19.jpg",19),
			(default,"Buffet5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/76_Lobby19.jpg",19),
            (default,"Lobby5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/77_Lobby_20.jpg",20),
            (default,"Room5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/78_Room_20.jpg",20),
            (default,"Pool5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/79_Room_20.jpg",20),
		 	(default,"Buffet5","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/80_Buffet_20.jpg",20),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/81_img.jpg",21),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/82_Room_21.jpg",21),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/83_kitchen_21.webp",21),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/84_LivingRoom_21.webp",21),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/85_Room_22.webp",22),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/86_Buffet_22.webp",22),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/87_kitchen_22.webp",22),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/88_buffet_22.webp",22),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/89_kitchen_23.webp",23),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/90_Room_23.webp",23),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/91_Room_23.webp",23),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/92_LivingRoom_23.webp",23),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/93_LivingRoom_24.webp",24),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/94_LivingRoom_24_1.webp",24),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/95_Room_24.webp",24),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/96_Room_24_1.webp",24),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/97_Room_25.webp",25),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/98_Buffet_25.webp",25),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/99_Room_25_1.webp",25),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/100_Buffet_25.webp",25),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/101_Room_26.webp",26),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/102_Hotel_26.webp",26),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/103_Buffet_26.webp",26),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/104_Hotel_26_1.webp",26),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/105_Room_27.webp",27),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/106_Buffet_27.webp",27),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/107_Lobby_27.webp",27),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/108_Hotel_27.webp",27),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/109_Room_28.webp",28),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/110_Buffet_28.webp",28),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/111_Buffet_28_1.webp",28),
            (default,"img","https://s3-images-g4c6.s3.us-east-2.amazonaws.com/images/112_Buffet_28_2.webp",28);







INSERT INTO bookings
VALUES (default,convert("2021-08-19",date),convert("2021-09-19",date),1,1),
       (default,convert("2021-08-19",date),convert("2021-09-19",date),2,2),
       (default,convert("2021-04-19",date),convert("2021-05-19",date),1,1),
       (default,convert("2021-08-02",date),convert("2021-08-18",date),1,1);

INSERT INTO products_users
VALUES (1,2),
       (1,3);
       
       CREATE TABLE if not exists policies (
                                      id_policy int primary key NOT NULL auto_increment,                                  
									House_rules varchar(2000) ,
                                    security varchar(2000),
                                    cancellation_policy varchar(2000),
                                    id_product int unique,
                                     FOREIGN KEY (id_product) REFERENCES products(id_product) on delete cascade);


select * from users;

