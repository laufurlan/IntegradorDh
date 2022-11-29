drop schema if exists hotels;
create schema if not exists hotels;
use hotels;

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
            password varchar(45) not null,
            id_role int,
           FOREIGN KEY (id_role) REFERENCES roles(id_role));
           
           
           
           CREATE TABLE if not exists products (
        	id_product int primary key NOT NULL auto_increment,
        	title varchar(50) NOT NULL,
        	id_category int NOT NULL ,
        	id_city int not null,
           url_main_image varchar(400),
           description varchar(3000),
			FOREIGN KEY (id_category) REFERENCES categories(id),
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


#ALTER TABLE bookings
#ADD CONSTRAINT unique_booking UNIQUE (initial_date, final_date,id_product);
   	#Agregando datos

       INSERT INTO categories
   	VALUES (default,'Hoteles', 'Alojamiento en hoteles','https://images.pexels.com/photos/164595/pexels-photo-164595.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2' ),
          (default,'Hostales', 'Alojamiento en hostales','https://images.pexels.com/photos/5137980/pexels-photo-5137980.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
          (default,'Apartamentos','Alojamiento en Apartamentos','https://images.pexels.com/photos/1571460/pexels-photo-1571460.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
          (default,'Break and Brekfast', 'Alojamiento en break and Brekfast', 'https://images.pexels.com/photos/279746/pexels-photo-279746.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');


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
          (default,"Rio de Janeiro","Estado de Rio de Janeiro","Brasil");

   		 INSERT INTO products
	 VALUES (default,"Hermitage Hotel",1,1,"https://images.pexels.com/photos/2290738/pexels-photo-2290738.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2","Está situado a solo unas calles de la avenida Alvear, de la avenida Quintana, del parque San Martín y del distrito de Recoleta. En las inmediaciones también hay varios lugares de interés, como la calle Florida, el centro comercial Galerías Pacífico, la zona de Puerto Madero, la plaza de Mayo y el palacio Municipal.

Nuestros clientes dicen que esta parte de Buenos Aires es su favorita, según los comentarios independientes.

El Hotel es un hotel sofisticado de 4 estrellas que goza de una ubicación tranquila, a poca distancia de prestigiosas galerías de arte, teatros, museos y zonas comerciales. Además, hay WiFi gratuita.
El establecimiento sirve un desayuno variado de 07:00 a 10:30.

"),
	    (default,"Dazzler by Wyndham Polo",1,1,"https://media.staticontent.com/media/pictures/08b8be39-3be4-40ab-9484-12309ceee849/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","El Dazzler by Wyndham Polo se encuentra en el barrio de Palermo, en Buenos Aires, a 1 km del Campo Argentino de Polo y del Jardín Botánico, a 800 m del Centro de Exposiciones La Rural y a 2 km del centro comercial Alto Palermo Shopping. Dispone de terraza, solárium, gimnasio y Wi-Fi gratuito.

Las habitaciones están equipadas con aire acondicionado, TV LED, minibar y baño privado con secador de pelo. Las categorías difieren en tamaño y las suites, además, poseen zona de estar independiente con sofá y 2 TVs LED de 40”.

Entre las comodidades del Dazzler by Wyndham Polo encontrará recepción 24h, servicio de conserjería y el ofrecimiento de traslados, lavandería y tintorería por un cargo extra. Hay convenio para solicitar estacionamiento por un cargo extra, a un lado del hotel.

Todas las mañanas se sirve desayuno, con medialunas, jugos, yogures y frutas. Si desea cenar afuera podrá ir a los bares y restaurantes de Las Cañitas, a 1 km, y de Plaza Serrano, a 2 km del establecimiento.

La propiedad se sitúa a 4 km del Aeropuerto Internacional Jorge Newbery. El Rosedal queda a 1.5 km y la Embajada de Estados Unidos, a 600 m"),
            (default,"Hotel Madero Buenos Aires",1,1,"https://media.staticontent.com/media/pictures/c35c77b2-0238-449f-9aa0-3ef9e3137ef4/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","Localizado en el Barrio de Puerto Madero en Buenos Aires, el Hotel Madero se encuentra a 3 km del Obelisco, 20 minutos en coche de la Plaza de Mayo y a 32 km del Aeropuerto Internacional Ministro Pistarini de Ezeiza. La propiedad ofrece internet Wi-Fi gratis y desayuno de cortesía.

Entre los servicios disponibles se encuentran piscina cubierta, spa y gimnasio, así como salas de reuniones y estacionamiento con cargo adicional.

El Red Resto & Lounge ofrece una carta de cocina regional y experimental, cuenta con una cava de vino y un sommelier que asesorará a los huéspedes. El desayuno tipo buffet es servido a diario.

Hotel Madero se localiza a 100 m de los restaurantes de Puerto Madero, el barrio San Telmo está a 1 km y el Aeroparque Internacional Jorge Newbery a 10 km."),
           (default,"Huinid Obelisco Hotel",1,1,"https://media.staticontent.com/media/pictures/08d1679e-85b5-4ad8-94e3-3f0483be9245/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","Huinid Obelisco Hotel se sitúa en Buenos Aires. Dispone de wi-fi gratis en zonas comunes, bañera / tina de hidromasaje y gimnasio, así como recepción 24 hrs.

Necesitas saber:
• Accesible para personas con movilidad reducida
• Unidades adaptadas a personas con movilidad reducida
• Mascotas: no se admiten
• Propiedad libre de humo

El alojamiento sirve diariamente el desayuno, el cual se ofrece en el restaurante. También dispone de bar y cafetería.

Entre las comodidades se destacan computadora para huéspedes, solárium, ascensor y toallas. Los huéspedes también podrán disfrutar de sábanas. Por un suplemento, la propiedad cuenta con estacionamiento limitado y servicio de lavandería."),
           (default,"Cyan Américas Towers Hotel",1,1,"https://media.staticontent.com/media/pictures/a8ac488d-fbe6-48c2-88e7-db62a73bdd2f/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","El Cyan Américas Towers Hotel está ubicado en el barrio de Recoleta, en Buenos Aires, a 100 m de la Avenida 9 de Julio. Dispone de desayuno, piscina de temporada con solarium y Wi-Fi gratis.

Brújula:
• Ubicado a 1,5 km del Cementerio de la Recoleta y Galerías Pacífico.
• A 15 minutos a pie del Teatro Colón y del Obelisco.
• El Cyan Américas Towers Buenos Aires queda a 2,5 km de Puerto Madero.
• El Aeropuerto Internacional Jorge Newbery se encuentra a 7 km.
• A 20 minutos en coche de la Plaza Dorrego, en el barrio de San Telmo."),
            (default,"HTL 9 de Julio Bs As",1,1,"https://media.staticontent.com/media/pictures/db9c7911-c2dc-4858-9013-0910653629d3/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","El HTL 9 de Julio ofrece lofts con microondas y un pequeño refrigerador, a 10 m de la Avenida 9 de Julio y a 900 m del Obelisco, en Buenos Aires. Con desayuno servido en la habitación, se sitúa a 10 minutos a pie de la calle peatonal Florida y la Plaza de Mayo.

Necesitas saber:
• Se ofrecen traslados y estacionamiento externo, a 200 m por un suplemento.

Para el desayuno buffet se puede elegir entre infusiones calientes, panificados, pastelería y yogur, además de fiambres.

Brújula:
• Los huéspedes del HTL 9 de Julio se encontrarán a 600 m del histórico Café Tortoni.
• A 1 km del Teatro Colón.
• A 1.5 km de Puerto Madero y San Telmo.
• En bus, el Cementerio de la Recoleta queda a 20 minutos.
• El Aeroparque Internacional Jorge Newbery está a 20 minutos en auto."),
            (default,"HTL City Baires",1,1,"https://media.staticontent.com/media/pictures/79dbc14f-e2c0-45dc-a5b1-8c690f91cf33/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","HTL City Baires se sitúa en Buenos Aires, a 500 m de Casa Rosada, a 750 m de Puerto Madero y a 1 km del Mercado de San Telmo. Ofrece Wi-Fi gratis.

Las habitaciones cuentan con TV por cable y baño privado con bañera.

Entre los servicios de la propiedad se encuentran estacionamiento con costo extra sujeto a disponibilidad, recepción 24hs y servicio de consejería, así como servicio de lavandería y planchado, ambas con costo adicional.

La Terminal de Buses de Retiro se encuentra a 3,5 km de la propiedad y el ​Aeropuerto Internacional de Ezeiza, a 31 km."),
            (default,"Savoy Hotel",1,1,"https://media.staticontent.com/media/pictures/70f51778-303f-4ad3-84a3-1f432c5dbf24/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","Con arquitectura de estilo neobarroco, El Savoy Hotel está ubicado en Buenos Aires, a 500 m de la zona de teatros y restaurantes de la Avenida Corrientes, a 20 minutos a pie del Obelisco y a 1.5 km del Teatro Colón. Se encuentra a 300 m de la estación Callao de la línea B, que conecta con Puerto Madero y el distrito financiero en 10 minutos y a 400 m de la estación Congreso de la línea A, que llega al Café Tortoni, la Plaza de Mayo y la peatonal Florida en el mismo tiempo. El Aeroparque Internacional Jorge Newbery está a 7.5 km del hotel, que dispone de Wi-Fi gratuito.

El desayuno buffet, es de estilo americano e incluye infusiones calientes, jugos, tostadas y medialunas, además de frutas, cereales, yogur y budines. También cuenta con variedad de quesos y fiambres, huevos revueltos, arroz y vegetales salteados. Se ofrecen productos orgánicos de bajas calorías. Todas las tardes, en el lobby-bar Imperio, se puede degustar el Té de las 5, que incluye copa de vino espumante, selección de tés, café y jugo, además de mini-sandwiches, tarteletas frutales y escones. En el bar también se sirven aperitivos, tapas y cocteles. El Restaurante Las Manzanas ofrece carta de vinos y cocina moderna de autor con evocaciones de la gastronomía francesa. Para el almuerzo, se puede optar por un buffet ejecutivo mediterráneo.

Las habitaciones están equipadas con TV LCD 32” con cable, aire acondicionado y calefacción con control individual, escritorio y vestidor, además de minibar y teléfono. El baño incluye secador de cabello, box de ducha o bañera sujeta a disponibilidad, amenidades y espejo de vanidad. Algunas unidades cuentan con bata, pantuflas y amenidades diferenciadas. Otras categorías permiten acceso a un espacio VIP, con infusiones calientes, bollería dulce, salas de estar y pantallas LCD.

El establecimiento tiene centro de negocios con escritorio, computadoras e impresora, 11 salas de reuniones y servicio de conserjería. En el entrepiso del hotel, se puede utilizar el gimnasio 24h y reservar salas de masajes, además de estacionamiento externo a 50 m por un cargo extra.

Por medio del ómnibus, se puede llegar en 15 minutos al Cementerio de la Recoleta, en 25 minutos a San Telmo, en 30 minutos al Jardín Japonés y en 40 minutos a Caminito. El Aeropuerto Internacional de Ezeiza – Ministro Pistarini se encuentra a 30.5 km del hotel."),
            (default,"Regal Pacific Puerto Madero",1,1,"https://media.staticontent.com/media/pictures/d86039d9-c100-476b-a9b6-1bbfb2d29691/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","El Hotel Regal Pacific Puerto Madero está ubicado en el barrio de Retiro, en Buenos Aires, a 5 minutos caminando de los restaurantes de Puerto Madero y de la zona empresarial de Catalinas, a 500 m de la calle Florida y Galerías Pacífico y a 1.5 km del Obelisco. Ofrece habitaciones de 38 m² y recepción 24h con personal idóneo para brindar asistencia.

Necesitas saber:
• Los huéspedes dicen que el desayuno es muy variado.
• El estacionamiento es gratuito, sujeto a disponibilidad.
• Hay cunas gratis, sujetas a disponibilidad.

El desayuno buffet americano, que está incluido en algunas tarifas, cuenta con estación de frutas y cereales, fiambres y pastelería, así como platos calientes. En el Restaurante Ébano se sirve cocina contemporánea y en el Sommelier Lounge, degustará vinos y cocteles, acompañados por quesos y postres.

Brujula:
• El Teatro Colon, la Plaza de mayo y los teatros de Avenida Corrientes se encuentra a 15 minutos caminando
• El Aeroparque Internacional Jorge Newbery está a 7.5 km
• El Aeropuerto Internacional de Ezeiza se encuentra a 34 km.
eiza, a 34 km."),
            (default,"Dazzler by Wyndham Palermo",1,1,"https://media.staticontent.com/media/pictures/902e7da8-a0f0-478e-b3e0-6fdddbe1ef92/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","Rodeado de bares y restaurantes en el barrio de Palermo Hollywood, el Dazzler by Wyndham Palermo se encuentra a 700 m de Plaza Serrano y a 1.5 km de la Estación de Metro Palermo. El Aeroparque Internacional Jorge Newbery queda a 7 km de la propiedad, que dispone de terraza con vista panorámica y conexión Wi-Fi gratuita en todas sus instalaciones.

Todas las habitaciones están equipadas con aire acondicionado con control individual, TV LCD de 42” por cable, minibar y escritorio, además de caja fuerte y ventanas con aislamiento acústico. Los baños cuentan con bañera, secador de cabello y artículos de aseo.

En el último piso del Dazzler by Wyndham Palermo se ofrece un desayuno buffet que consiste en infusiones calientes, variedad de panes y medialunas, además de jamón y queso, huevos revueltos y frutas. Los huéspedes pueden solicitar servicio de habitación para el almuerzo y la cena.

Las comodidades que incluye son estacionamiento por un costo adicional, gimnasio y servicio de traslado por un cargo extra. La recepción del hotel está disponible las 24h y ofrece información turística de la ciudad, además de depósito de equipaje gratuitamente.

El Dazzler by Wyndham Palermo está ubicado a 600 m de las tiendas de indumentaria outlet de la Avenida Córdoba y a 20 minutos en auto del Cementerio de la Recoleta. El Aeropuerto Internacional de Ezeiza – Ministro Pistarini se halla a 30 km del establecimiento."),
            (default,"Dazzler by Wyndham Recoleta",1,1,"https://media.staticontent.com/media/pictures/e17733af-8308-4982-8a6a-7268ea4c1587/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","Situado en el barrio de Recoleta, en Buenos Aires, el Dazzler by Wyndham Recoleta ofrece habitaciones equipadas con Wi-Fi grátis.

Necesitas saber:
• Algunos huéspedes consideran que el baño podría ser mejor.

En el comedor del Dazzler by Wyndham Recoleta se ofrece un desayuno buffet diariamente que consiste en frutas, cereales, pastelería y panes, además de medialunas, fiambres y una selección de bebidas. Los huéspedes también disponen de servicio a la habitación.

Brújula:
• A 400 m del Cementerio de la Recoleta.
• El Dazzler by Wyndham Recoleta se halla a 1 km de la Estación de Metro Pueyrredón, que conecta con el Obelisco en 10 minutos y con la Peatonal Florida en 15 minutos.
• A 10 minutos a pie de Plaza Francia.
• El Aeroparque Internacional Jorge Newbery queda a 7 km de la propiedad.
• El Aeropuerto Internacional de Ezeiza – Ministro Pistarini queda a 33 km del hotel."),
            (default,"Che Juan Hostel BA",2,1,"https://media.staticontent.com/media/pictures/ec3f806e-e1c0-48b7-8e8b-b00ce071f4ef/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","Che Juan Hostel BA está localizado en Buenos Aires. Ofrece wi-fi gratis en zonas comunes, salón de juegos y recepción 24 hrs, así como venta de entradas.

Necesitas saber:
• Mascotas: no se admiten
• Caja fuerte en la recepción
• Propiedad libre de humo

El alojamiento ofrece todos los días el desayuno con costo adicional. Los huéspedes podrán cocinar en la comodidad de su alojamiento, en su asador.

Las comodidades incluyen biblioteca, tv en zonas comunes, ascensor y servicio de conserjería Por un costo adicional, la propiedad cuenta con servicio de guarda-equipaje y servicio de lavandería."),
            (default,"Franca City Hostel",2,1,"https://media.staticontent.com/media/pictures/c48f6e27-49bd-4ef0-80bd-22fd989708fa/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","Franca City Hostel está localizado en Buenos Aires. Cuenta con wi-fi gratis en zonas comunes, servicio de masajes y recepción 24 hrs, además de información turística.

Necesitas saber:
• Check-in y check-out express
• Mascotas: no se admiten
• Caja fuerte en la recepción
• Propiedad libre de humo

El establecimiento posee un bar donde podrás degustar las especialidades de la casa. También es posible disfrutar de su snack bar. El personal de la propiedad proporcionará servicio a la habitación. Los huéspedes podrán cocinar en la comodidad de su alojamiento, en su cocina compartida.

Las comodidades incluyen venta de entradas, sala de reuniones, biblioteca y tv en zonas comunes. Los huéspedes también podrán disfrutar de seguridad 24 hrs y toallas. Por un costo adicional, la propiedad cuenta con servicio de traslado al aeropuerto, servicio de guarda-equipaje y servicio de lavandería."),
            (default,"Palermo Soho Hostel",2,1,"url","Si decides alojarte en Palermo Soho Hostel, te encontrarás en una fantástica zona de Buenos Aires (Palermo), a solo unos pasos de Palermo Soho y a apenas 12 min a pie de Plaza Italia. Además, este albergue se encuentra a 9,8 km de Teatro Colón y a 10,1 km de Obelisco.
Este albergue dispone de espacios para fumadores.
Tendrás un servicio de recepción las 24 horas, consigna de equipaje y una lavandería a tu disposición.
Se ofrece un desayuno bufé gratuito todos los días de 8:00 a 10:00.
Te sentirás como en tu propia casa en cualquiera de las 14 habitaciones. Mantén el contacto con los tuyos gracias a la conexión a Internet wifi gratis. El cuarto de baño está provisto de ducha. Entre las comodidades, se incluyen tabla de planchar con plancha, además de un servicio de limpieza disponible todos los días."),
            (default,"Ba Stop Buenos Aires Hostel",2,1,"https://media.staticontent.com/media/pictures/f5dfbd1d-22b2-4141-9612-5e66ed703d99/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","Sobre Ba Stop Buenos Aires Hostel
Ba Stop Buenos Aires Hostel está localizado en Buenos Aires. Cuenta con wi-fi gratis en zonas comunes, salón de juegos y venta de entradas, así como computadora para huéspedes.

Necesitas saber:
• Acceso a unidades por escaleras
• Check-in y check-out express
• Mascotas: no se admiten
• Caja fuerte en la recepción

Entre los servicios de la propiedad se encuentran biblioteca, terraza, tv en zonas comunes y recepción con horario limitado. Los huéspedes también podrán disfrutar de servicio de conserjería. Por un costo adicional, la propiedad cuenta con servicio de traslado al aeropuerto, servicio de guarda-equipaje y servicio de lavandería."),
            (default,"Master Hostel Borges",2,1,"https://media.staticontent.com/media/pictures/72b4968b-e144-4b12-bd85-4e9a550a0f69/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","Ubicación del establecimiento Si te alojas en Master Hostel Borges, en Buenos Aires (Palermo), estarás a 1 minutos a pie de Palermo Soho. Este albergue se encuentra cerca de Teatro Colón y Obelisco. Habitaciones Te sentirás como en tu propia casa en una de las 20 habitaciones con frigorífico y televisor LED. Prepare sus comidas en la cocina compartida / comunitaria. Televisión por cable se proporciona para su entretenimiento. Los baños disponen de ducha, artículos de higiene personal gratuitos y secador de pelo. Servicios Disfruta de las vistas desde una terraza y aprovecha servicios como conexión a Internet wifi gratis y televisor en zonas comunes.Para comer Todos los días se sirve un desayuno estilo bufé gratuito. 10 AM.Servicios de negocios y otros Entre los servicios adicionales figuran una zona de ordenadores, servicio de recepción 24 horas y microondas en las zonas comunes. El check-in comienza a las 2 PM Hora de salida es 10 AM"),
            (default,"Art Factory Hostel San Telmo",2,1,"https://media.staticontent.com/media/pictures/a090b476-43f3-4c95-89c1-905fcff06d96/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","Art Factory Hostel San Telmo está localizado en Buenos Aires. Cuenta con wi-fi gratis en zonas comunes y venta de entradas, así como terraza.

Necesitas saber:
• Alojamiento / hospedaje solo para adultos
• Mascotas: no se admiten
• Propiedad libre de humo

Los huéspedes podrán cocinar en la comodidad de su alojamiento, en su asador.

Las comodidades incluyen recepción con horario limitado y servicio de conserjería. Por un costo adicional, la propiedad cuenta con servicio de traslado al aeropuerto, bicicletas disponibles y servicio de guarda-equipaje."),
            (default,"America Del Sur Hostel",2,1,"https://media.staticontent.com/media/pictures/d8b32e6a-0a54-457a-9ccf-67a6b2773765/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","America Del Sur Hostel se sitúa en Buenos Aires. Cuenta con wi-fi gratis en zonas comunes, recepción 24 hrs y venta de entradas, además de biblioteca.

Necesitas saber:
• Unidades adaptadas a personas con movilidad reducida
• Mascotas: no se admiten
• Zona de fumadores

El alojamiento ofrece todos los días el desayuno con costo adicional. Los huéspedes podrán cocinar en la comodidad de su alojamiento, en su asador.

Entre las comodidades se destacan zona de picnic, tv en zonas comunes, ascensor y servicio de conserjería Por un costo adicional, la propiedad cuenta con servicio de guarda-equipaje."),
            (default,"Casa Franca Recoleta Hostel",2,1,"https://media.staticontent.com/media/pictures/8458cf20-0395-4586-aa4e-87b873dba1ee/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","En Buenos Aires (Recoleta), Casa Franca Recoleta Hostel, en la zona de Recoleta, en Buenos Aires, se encuentra a 10 minutos en auto de Obelisco y Plaza San Martín. Hospédate en este hostel y estarás a 1,4 km de Avenida 9 de Julio, así como a 2,4 km de Teatro Colón. Te sentirás como en tu propia casa en una de las 10 habitaciones con aire acondicionado y estación para iPod. Las camas cuentan con colchones un colchón Select Comfort y cubrecama para descansar plácidamente. Mantén el contacto con los tuyos gracias al acceso a internet por wifi de cortesía. El cuarto de baño dispone de ducha. Este hostel pone a tu disposición una cafetería para que comas un snack u otra cosa ligera. Disfruta de tu bebida favorita en el Bar. Aprovecha los prácticos servicios que se te ofrecen, como acceso a internet por wifi gratuito o servicios de concierge. Tendrás servicio de recepción las 24 horas, resguardo de equipaje y ascensor a tu disposición."),
            (default,"DEL900 Hostel Boutique",2,1,"https://media.staticontent.com/media/pictures/b724eb73-12fc-4e2f-b105-4be446159903/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","DEL900 Hostel Boutique se sitúa en Buenos Aires. Cuenta con wi-fi gratis en zonas comunes.

El alojamiento sirve diariamente el desayuno con costo adicional, el cual se ofrece en el bar. Los huéspedes podrán cocinar en la comodidad de su alojamiento, en su asador.

Entre los servicios de la propiedad se encuentran recepción con horario limitado y servicio de conserjería. Por un costo adicional, la propiedad cuenta con servicio de traslado al aeropuerto y servicio de lavandería."),
            (default,"La Maison Hostel Boutique",2,1,"https://media.staticontent.com/media/pictures/be930abe-b2fb-46a8-8db2-fac29574b821/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","A poca distancia de Teatro Colón, La Maison Hostel Boutique, en la zona de Recoleta, en Buenos Aires, se encuentra a 15 minutos a pie de Teatro Colón y Calle Florida. Hospédate en este hostel y estarás a 1,4 km de Obelisco, así como a 1,6 km de Plaza San Martín. Te sentirás como en tu propia casa en una de las 8 habitaciones. Mantén el contacto con los tuyos gracias al acceso a internet por wifi de cortesía. El cuarto de baño dispone de ducha. Tendrás resguardo de equipaje, caja de seguridad en la recepción y microondas en las áreas comunes a tu disposición."),
            (default,"CH Recoleta Suites",3,1,"https://media.staticontent.com/media/pictures/94bc4100-afd0-4cc0-8d93-a5cdfe575eb7/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","El CH Recoleta Suites es un complejo de departamentos situado en el barrio de la Recoleta, en Buenos Aires. Ofrece Wi-Fi gratuito y recepción disponible las 24 horas.

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

Nuestros huéspedes recomiendan el CH Recoleta Suites por su ubicación, por la relación costo-beneficio y por la atención de los empleados."),
            (default,"Dreaming Uriarte",3,1,"https://media.staticontent.com/media/pictures/c8af6383-17af-4516-874d-644111b799e7/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","Dreaming Uriarte se sitúa en Buenos Aires. Ofrece internet por cable gratis en zonas comunes y ascensor, además de toallas.

Necesitas saber:
• Accesible para personas con movilidad reducida
• Unidades adaptadas a personas con movilidad reducida
• Mascotas: no se admiten

Las comodidades incluyen sábanas, recepción con horario limitado y aire acondicionado en zonas comunes. Por un cargo, la propiedad cuenta con servicio de traslado al aeropuerto."),
            (default,"La Casona del Alma",3,1,"https://media.staticontent.com/media/pictures/93fd49a1-18ca-433d-800f-9439c30ce4aa/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","La Casona del Alma se encuentra en Buenos Aires. Cuenta con wi-fi gratis en zonas comunes, servicio de cambio de moneda y jardín, además de solárium.

Necesitas saber:
• Mascotas: no se admiten

Las comodidades incluyen toallas, sábanas, aire acondicionado en zonas comunes y calefacción en zonas comunes Por un cargo, la propiedad cuenta con servicio de traslado al aeropuerto."),
            (default,"Paraguay 716",3,1,"https://media.staticontent.com/media/pictures/46e5f09f-0577-4ce9-a80b-ee62b759da25/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","Paraguay 716 está localizado en Buenos Aires. Dispone de wi-fi gratis en zonas comunes, recepción 24 hrs y servicio de guarda-equipaje gratis, además de solárium.

Necesitas saber:
• Mascotas: no se admiten

El personal de la propiedad proporcionará servicio a la habitación.

Entre las comodidades se destacan seguridad 24 hrs, ascensor, lockers y toallas. Los huéspedes también podrán disfrutar de sábanas y aire acondicionado en zonas comunes. Por un cargo, la propiedad cuenta con servicio de lavandería."),
            (default,"Lopez Hostel & Suites",4,1,"https://media.staticontent.com/media/pictures/4bb40519-670a-4ddf-b3ab-1f1442385d5e/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","Lopez Hostel & Suites está localizado en Buenos Aires. Dispone de wi-fi gratis en zonas comunes, venta de entradas y biblioteca, así como zona de picnic.

Necesitas saber:
• Alojamiento / hospedaje solo para adultos
• Mascotas: no se admiten
• Zona de fumadores

Los huéspedes podrán cocinar en la comodidad de su alojamiento, en su asador.

Entre las comodidades se destacan terraza, jardín, tv en zonas comunes y recepción con horario limitado. Los huéspedes también podrán disfrutar de servicio de conserjería. Por un costo adicional, la propiedad cuenta con servicio de traslado al aeropuerto, servicio de guarda-equipaje y servicio de lavandería."),
            (default,"Art Factory Soho",4,1,"https://media.staticontent.com/media/pictures/c62d555e-2f0f-4f73-8d36-ffe355014762/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","Art Factory Soho está localizado en Buenos Aires. Dispone de wi-fi gratis en zonas comunes.

Necesitas saber:
• Acceso a unidades por escaleras
• Mascotas: no se admiten

Entre los servicios de la propiedad se encuentran venta de entradas y servicio de conserjería. Por un cargo, la propiedad cuenta con servicio de traslado al aeropuerto, servicio de guarda-equipaje y toallas y sábanas."),
            (default,"Sobre Mansilla 3935 B&B",4,1,"https://media.staticontent.com/media/pictures/31e733cb-2b4a-4a3f-b057-bba3e92df782/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","Mansilla 3935 B&B está localizado en Buenos Aires. Cuenta con wi-fi gratis en zonas comunes y tv en zonas comunes, además de aire acondicionado en zonas comunes.

Entre las comodidades se destacan calefacción en zonas comunes y servicio de despertador."),
            (default,"La cascada Townhouse Hotel",4,1,"https://media.staticontent.com/media/pictures/f3f9fd5d-4962-4b22-9738-783c86c348f6/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2","La cascada Townhouse Hotel se encuentra en Buenos Aires. Dispone de wi-fi gratis en zonas comunes, servicio de guarda-equipaje gratis y jardín, así como seguridad 24 hrs.

Necesitas saber:
• Alojamiento / hospedaje solo para adultos
• Accesible para personas con movilidad reducida

El alojamiento ofrece todos los días el desayuno.

Entre los servicios de la propiedad se encuentran toallas, sábanas, aire acondicionado en zonas comunes y calefacción en zonas comunes. Los huéspedes también podrán disfrutar de servicio de despertador. Por un cargo, la propiedad cuenta con estacionamiento limitado.");
			

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
     (1,2),
     (1,3),
     (1,4),
     (1,5),
     (1,6),
     (1,7),
	    (2,1),
            (2,2),
            (2,3),
            (2,5),
            (2,7),
            (2,8),
            (2,9),
            (3,2),
            (3,3),
            (3,5),
            (3,6),
            (3,7),
            (3,8),
            (3,9),
            (4,2),
            (4,3),
            (4,5),
            (4,7),
            (4,8),
            (4,9),
			(5,2),
            (5,3),
            (5,5),
            (5,6),
            (5,7),
            (5,8),
            (5,9),
            (6,1),
            (6,2),
            (6,3),
            (6,6),
            (6,7),
             (7,1),
            (7,2),
            (7,3),
            (7,6),
            (7,7),
            (8,2),
            (8,3),
            (8,5),
            (8,7),
            (8,9),
            (9,2),
            (9,3),
            (9,5),
            (9,7),
            (9,9),
            (10,1),
            (10,2),
            (10,3),
            (10,5),
            (10,7),
            (10,8),
            (10,9),
            (11,1),
            (11,2),
            (11,3),
            (11,5),
            (11,7),
            (11,8),
            (11,9),
            (12,1),
            (12,3),
            (12,7),
            (13,1),
            (13,3),
            (13,7),
            (14,1),
            (14,3),
            (14,7),
            (15,1),
            (15,3),
            (15,7),
            (16,1),
            (16,3),
            (16,7),
            (17,1),
            (17,3),
            (17,7),
            (18,1),
            (18,3),
            (18,7),
            (19,1),
            (19,3),
            (19,7),
            (20,1),
            (20,3),
            (20,7),
            (21,1),
     (21,2),
     (21,3),
     (21,4),
     (21,5),
     (21,7),
     (22,1),
     (22,2),
     (22,3),
     (22,4),
     (22,5),
     (22,7),
     (23,1),
     (23,2),
     (24,3),
     (25,4),
     (25,5),
     (25,7),
     (26,2),
     (26,3),
     (26,4),
     (26,7),
       (27,2),
     (27,3),
     (27,4),
     (27,7),
       (28,2),
     (28,3),
     (28,4),
     (28,7);
        
            
            
               
	INSERT INTO images
	 VALUES (default,"lobby","https://media.staticontent.com/media/pictures/6b91f4de-a05a-4eb2-b8e2-82fd9a43ed10/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",1),
            (default,"Room1","https://media.staticontent.com/media/pictures/9f578686-ccff-404b-9bba-e583a5731c43/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",1),
            (default,"Buffet1","https://media.staticontent.com/media/pictures/df36a432-9d80-4392-8127-a94e24a1c5d9/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",1),
            (default,"Lobby1","https://media.staticontent.com/media/pictures/329850b7-9be9-4001-b43d-3adefff5377c/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",1),
            (default,"Lobby2","https://media.staticontent.com/media/pictures/667bc243-7d85-4faf-9651-d79413bd1e78/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",2),
            (default,"Room2","https://media.staticontent.com/media/pictures/43453c16-3dc5-4c8e-96a1-875567964b6d/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",2),
            (default,"Pool2","https://media.staticontent.com/media/pictures/786f096f-743d-42b6-9feb-84b9043ab52e/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",2),
            (default,"Buffet2","https://media.staticontent.com/media/pictures/43b412dd-1539-4974-8eb1-4f07cb5352d1/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",2),
            (default,"Lobby3","https://media.staticontent.com/media/pictures/d91767ad-fff0-48af-8b1e-cb8fc74a3679/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",3),
            (default,"Room3","https://media.staticontent.com/media/pictures/d2be5193-31bb-45d1-b35c-922741eee7ed/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",3),
            (default,"Pool3","https://media.staticontent.com/media/pictures/45a430dd-c2b7-4ed9-9f4b-09ee78266abb/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",3),
            (default,"Buffet3","https://media.staticontent.com/media/pictures/6768339e-1503-4b9a-81e5-3dac1b4b5e37/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",3),
            (default,"Lobby4","https://media.staticontent.com/media/pictures/f729083b-cc99-46bd-a6dc-ec6e748c4866/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",4),
            (default,"Room4","https://media.staticontent.com/media/pictures/9a9fdd21-e4f2-4dd3-86cf-b7de139b2616/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",4),
            (default,"Pool4","https://media.staticontent.com/media/pictures/752904fc-62b6-45ae-8628-a1f07e8815cd/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",4),
            (default,"Buffet5","https://media.staticontent.com/media/pictures/b66acaf6-5358-43c3-aa51-4361a0392df0/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",5),
            (default,"Lobby5","https://media.staticontent.com/media/pictures/4773c498-c289-42ef-9355-2d4794f9f54a/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",5),
            (default,"Room5","https://media.staticontent.com/media/pictures/7249428c-10ea-4964-9c13-20b66314b002/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",5),
            (default,"Pool5","https://media.staticontent.com/media/pictures/4353cec5-c92d-4f1a-bda5-31ff83931f0c/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",5),
            (default,"Buffet5","https://media.staticontent.com/media/pictures/f4758b9c-18a1-4813-8f68-388e8daf2998/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",5),
             (default,"Lobby5","https://media.staticontent.com/media/pictures/51ce8814-b189-4d33-a326-f6dbf4555ca7/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",6),
            (default,"Room5","https://media.staticontent.com/media/pictures/488d7752-02b3-485d-b1db-d7072ae02285/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",6),
            (default,"Pool5","https://media.staticontent.com/media/pictures/92425110-9b46-40e1-8f49-b8b3be57c8ea/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",6),
            (default,"Buffet5","https://media.staticontent.com/media/pictures/48e43e34-6125-41cd-80d4-8909a8223528/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",6),
             (default,"Lobby5","https://media.staticontent.com/media/pictures/2409f61d-80aa-4644-ba01-d016764a7853/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",7),
            (default,"Room5","https://media.staticontent.com/media/pictures/386e82de-2034-4291-ad1e-6c288d7bbdba/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",7),
            (default,"Pool5","https://media.staticontent.com/media/pictures/e990db0c-2add-4b55-88a2-be409c022c31/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",7),
			(default,"Buffet5","https://media.staticontent.com/media/pictures/aa161434-32ab-4324-9c4a-c36ed1e550bc/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",7),
             (default,"Lobby5","https://media.staticontent.com/media/pictures/64a36029-c4cf-45d6-a925-9b0597ed384f/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",8),
            (default,"Room5","https://media.staticontent.com/media/pictures/ba4f5a91-5bb7-4031-ada6-280959a378b7/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",8),
            (default,"Pool5","https://media.staticontent.com/media/pictures/7f3d53c1-3643-4c58-8dbc-db00c4a33e1e/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",8),
			(default,"Buffet5","https://media.staticontent.com/media/pictures/5722776e-0c23-4030-b513-08254bcfe49c/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",8),
            (default,"Lobby5","https://media.staticontent.com/media/pictures/76481848-9ca7-477e-952c-df2b375cbec6/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",9),
            (default,"Room5","https://media.staticontent.com/media/pictures/7946f8e9-e40d-4135-841a-0907371c35af/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",9),
            (default,"Pool5","https://media.staticontent.com/media/pictures/7d82a769-da77-4518-96fd-79a3268db33c/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",9),
			(default,"Buffet5","https://media.staticontent.com/media/pictures/5fd904aa-2adc-431a-be60-6359d1a77f06/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",9),
            (default,"Lobby5","https://media.staticontent.com/media/pictures/0662aba9-247b-4b1f-864e-1db29e111db9/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",10),
            (default,"Room5","https://media.staticontent.com/media/pictures/f5ed5030-2ba4-4ac2-a3be-287bf365b95b/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",10),
            (default,"Pool5","https://media.staticontent.com/media/pictures/7e6f675e-1869-4c8e-af15-9732c1eb005b/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",10),
			(default,"Buffet5","https://media.staticontent.com/media/pictures/c591b87c-7c82-4f5e-bcfa-b8a340e7d432/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",10),
            (default,"Lobby5","https://media.staticontent.com/media/pictures/6b828f32-2004-488a-932f-b2d3419390bb/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",11),
            (default,"Room5","https://media.staticontent.com/media/pictures/ae910f97-084e-46d4-bb71-c3d089cfccef/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",11),
            (default,"Pool5","https://media.staticontent.com/media/pictures/b67db1f7-8177-4468-a866-4d553864d9e2/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",11),
			(default,"Buffet5","https://media.staticontent.com/media/pictures/80978c4c-e874-48a1-a52b-aa3cf241ff98/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",11),
            (default,"Lobby5","https://media.staticontent.com/media/pictures/5b7c1054-1b8a-43d6-b409-af5455477d29/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",12),
            (default,"Room5","https://media.staticontent.com/media/pictures/b6b473c2-1e64-4b3e-97fc-93acd7a3aa2d/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",12),
            (default,"Pool5","https://media.staticontent.com/media/pictures/867e570f-c5f0-4af8-b42e-ac9ff06da109/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",12),
			(default,"Buffet5","https://media.staticontent.com/media/pictures/2ee76bb5-b5df-4b5c-824d-758ee9a2857e/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",12),
            (default,"Lobby5","https://media.staticontent.com/media/pictures/d0ca782b-23da-4b6b-b6d5-5dbb814cfff3/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",13),
            (default,"Room5","https://media.staticontent.com/media/pictures/8b031759-5bc5-4045-8625-df67fa13d468/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2//media.staticontent.com/media/pictures/88405562-13ca-45e9-bc39-d962ee4c5f6e/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",13),
            (default,"Pool5","https://media.staticontent.com/media/pictures/919adaf8-5ffe-4ac0-8c48-830cdce5b330/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",13),
			(default,"Buffet5","https://media.staticontent.com/media/pictures/919adaf8-5ffe-4ac0-8c48-830cdce5b330/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",13),
            (default,"Lobby5","https://media.staticontent.com/media/pictures/b2e9e442-d23b-4a82-ad1a-8f0d68e5f509/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",14),
            (default,"Room5","https://media.staticontent.com/media/pictures/11a982ad-326a-4834-8658-ecea4761f98e/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",14),
            (default,"Pool5","https://media.staticontent.com/media/pictures/e8be9782-5370-45c6-9363-dd3ab7a349d8/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",14),
			(default,"Buffet5","https://media.staticontent.com/media/pictures/1e0ccb1f-aebd-4c5d-9b53-b7ba33ee2cd4/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",14),
            (default,"Lobby5","https://media.staticontent.com/media/pictures/ba13e5c9-8a7a-400b-b2f9-e1b8dab9aaff/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",15),
            (default,"Room5","https://media.staticontent.com/media/pictures/5c38dc2c-f1e8-4095-aa56-21c7d669e0df/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",15),
            (default,"Pool5","https://media.staticontent.com/media/pictures/5c98b9d1-c120-45ad-a428-d1386361e9d6/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",15),
			(default,"Buffet5","https://media.staticontent.com/media/pictures/286ba866-389c-4bff-9def-2760047613c1/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",15),
            (default,"Lobby5","https://media.staticontent.com/media/pictures/76bcf1e8-a8c0-4cee-b58a-042f824b9181/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",16),
            (default,"Room5","https://media.staticontent.com/media/pictures/d8b32e6a-0a54-457a-9ccf-67a6b2773765/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",16),
            (default,"Pool5","https://media.staticontent.com/media/pictures/e4d60673-747d-4d3a-9a4c-17c23a432a7b/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",16),
			(default,"Buffet5","https://media.staticontent.com/media/pictures/e4d60673-747d-4d3a-9a4c-17c23a432a7b/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",16),
			(default,"Lobby5","https://media.staticontent.com/media/pictures/ab17113b-a951-4b30-a76b-a535d1f4c959/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",17),
            (default,"Room5","https://media.staticontent.com/media/pictures/5753c4c7-cbdb-4aba-b497-cbd242ec726a/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",17),
             (default,"Pool5","https://media.staticontent.com/media/pictures/464cf991-e525-4e75-a7b8-6e84d5c46702/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",17),
			(default,"Buffet5","https://www.despegar.com.ar/hoteles/h-4430845/casa-franca-recoleta-hostel-buenos+aires?from_source=site&rid=982&clickedPrice=ARS_11818&search_id=e9dfe1c6-46f0-4a48-ab97-8d8a7d21a3a5#showModal_0.6031934639395973",17),
            (default,"Lobby5","https://media.staticontent.com/media/pictures/9b3bf778-3bfb-41ad-b910-8b18bcebf522/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",18),
            (default,"Room5","https://media.staticontent.com/media/pictures/41bc5c20-5bac-45f5-9ed9-b9282087ea38/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",18),
             (default,"Pool5","https://media.staticontent.com/media/pictures/71e218c8-11f5-4d2a-9dd8-f5a63846e3d9/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",18),
			(default,"Buffet5","https://media.staticontent.com/media/pictures/1228046f-fd46-4352-8fdd-cf9a0147f9ce/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",18),
            (default,"Lobby5","https://media.staticontent.com/media/pictures/97a5a821-468c-4b19-9187-b94e5c659780/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",19),
            (default,"Room5","https://media.staticontent.com/media/pictures/a7fd1a56-a5fe-4d87-aa4f-c352bcb0b003/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",19),
             (default,"Pool5","https://media.staticontent.com/media/pictures/faf35ca2-6087-41cb-817e-710bcc0e3a6d/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",19),
			(default,"Buffet5","https://media.staticontent.com/media/pictures/faf35ca2-6087-41cb-817e-710bcc0e3a6d/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",19),
            (default,"Lobby5","https://media.staticontent.com/media/pictures/0da79e4b-b099-4842-ad14-6670a19faa6d/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",20),
            (default,"Room5","https://media.staticontent.com/media/pictures/99c8ae97-087e-4bc4-bc89-cd1b5de58cba/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",20),
             (default,"Pool5","https://media.staticontent.com/media/pictures/0efa8fb3-7b26-4c00-9948-7007eda8c1b9/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",20),
			(default,"Buffet5","https://media.staticontent.com/media/pictures/76e9f166-8d3f-4cad-955c-7a3f45dff12a/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",20),
            (default,"img","https://media.staticontent.com/media/pictures/c8af6383-17af-4516-874d-644111b799e7/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",21),
            (default,"img","https://media.staticontent.com/media/pictures/92500f8c-83b1-4144-9bde-d605f6b6e509/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",21),
            (default,"img","https://media.staticontent.com/media/pictures/1e7e3fd8-9aa2-4d92-95c3-bec982e2e34b/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",21),
            (default,"img","https://media.staticontent.com/media/pictures/7851463f-4c82-4077-809b-5910d8fec21d/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",21),
            (default,"img","https://media.staticontent.com/media/pictures/5eef7c41-31c0-45e7-8731-12e019cfedc3/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",22),
            (default,"img","https://media.staticontent.com/media/pictures/3aafd5a0-48ef-4649-8dd3-8262dc88290d/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",22),
            (default,"img","https://media.staticontent.com/media/pictures/a8018204-1436-4a9d-93b6-0784b8b8d612/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",22),
            (default,"img","https://media.staticontent.com/media/pictures/3aafd5a0-48ef-4649-8dd3-8262dc88290d/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",22),
            (default,"img","https://media.staticontent.com/media/pictures/441c9c39-a516-4940-b616-c146fdf857a4/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",23),
            (default,"img","https://media.staticontent.com/media/pictures/6b837c52-4f59-455e-851f-4bb09abcd080/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",23),
            (default,"img","https://media.staticontent.com/media/pictures/216b4c21-e011-485c-8e7b-005925c2e6bf/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",23),
            (default,"img","https://media.staticontent.com/media/pictures/f97965ce-39cc-45ad-ba11-288daaa598be/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",23),
            (default,"img","https://media.staticontent.com/media/pictures/fbe00110-48df-4580-97f2-8a48f75ebdcd/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",24),
            (default,"img","https://media.staticontent.com/media/pictures/f97965ce-39cc-45ad-ba11-288daaa598be/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",24),
            (default,"img","https://media.staticontent.com/media/pictures/6b837c52-4f59-455e-851f-4bb09abcd080/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",24),
            (default,"img","https://media.staticontent.com/media/pictures/46e5f09f-0577-4ce9-a80b-ee62b759da25/100x75?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",24),
            (default,"img","https://media.staticontent.com/media/pictures/21888ebd-9c9b-41ee-85dd-0dc91d20ee12/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",25),
            (default,"img","https://media.staticontent.com/media/pictures/f4aebb1c-b146-46fa-a785-908c12455a96/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",25),
            (default,"img","https://media.staticontent.com/media/pictures/35eba9c4-91b8-4315-89d3-cfd2fd95670d/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",25),
            (default,"img","https://media.staticontent.com/media/pictures/b9ed0d22-d429-4d03-975b-2bff40a2355e/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",25),
            (default,"img","https://media.staticontent.com/media/pictures/15851712-e284-4ca6-b552-775399163a10/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",26),
            (default,"img","https://media.staticontent.com/media/pictures/43170973-ae16-4998-b642-4f7981beb8ee/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",26),
            (default,"img","https://media.staticontent.com/media/pictures/59cec7c3-9497-4696-a5a8-597eef1661f3/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",26),
            (default,"img","https://media.staticontent.com/media/pictures/bbbb561d-c1e8-4e7f-b620-acd133174991/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",26),
            (default,"img","https://media.staticontent.com/media/pictures/31e733cb-2b4a-4a3f-b057-bba3e92df782/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",27),
            (default,"img","https://media.staticontent.com/media/pictures/dbdca598-f567-4d43-8201-befc47d9b996/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",27),
            (default,"img","https://media.staticontent.com/media/pictures/2081c91e-f4d5-4a13-a5cc-1529f2752ca6/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",27),
            (default,"img","https://media.staticontent.com/media/pictures/757f97eb-d887-4922-a4fb-bbb737c9b631/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",27),
            (default,"img","https://media.staticontent.com/media/pictures/73ef1371-7be3-46f3-a393-63e98ca90590/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",28),
            (default,"img","https://media.staticontent.com/media/pictures/403140f0-065c-408a-b917-7ca081da118d/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",28),
            (default,"img","https://media.staticontent.com/media/pictures/fa5fc590-6a0f-48e5-aa93-003d2e9bd731/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",28),
            (default,"img","https://media.staticontent.com/media/pictures/3a0d93ce-25d4-41ad-adae-620ad40e8f44/1120x430?op=TRUNCATE&enlarge=false&gravity=ce_0_0&quality=80&dpr=2",28),
			(default,"abc1","url3",29);

    INSERT INTO roles
   	 VALUES (default,"offerer"),
               (default,"client");
               
	  INSERT INTO users
   	 VALUES (default,"Shakira","Mebarak","shakira@gmail.com","contraseñadeshakira",2),
		(default,"Martina","Stoessel","Tini@gmail.com","contraseñadetini",2),
        (default,"Juan","Reyes","Juan@gmail.com","contrasñadeJuani",1);
          
          
               
               
	INSERT INTO bookings
   	 VALUES (default,convert("2021-08-19",date),convert("2021-09-19",date),1,1),
     (default,convert("2021-08-19",date),convert("2021-09-19",date),2,2),
     (default,convert("2021-04-19",date),convert("2021-05-19",date),1,1),
     (default,convert("2021-08-02",date),convert("2021-08-18",date),1,1);
