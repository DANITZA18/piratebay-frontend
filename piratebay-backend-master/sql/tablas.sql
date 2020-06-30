-- TABLAS
create table product_warehouse (id serial primary key,
							   product_id integer not null,
								warehouse_id integer not null,
								provider_id integer not null,
								stock integer not null,
								m_stock integer not null,
								creation_date date,
								FOREIGN KEY(product_id) REFERENCES product(product_id),
								FOREIGN KEY(warehouse_id) REFERENCES warehouse(warehouse_id),
								FOREIGN KEY(provider_id) REFERENCES provider(provider_id)
							   );

CREATE TABLE kardex(id serial primary key,
				   product_warehouse_id integer not null,
					concept varchar(255)not null,
					kdate date not null, 
					invoice varchar(255) null,
					income_q integer null,
					income_uc numeric(24,2) null,
					income_total numeric(24,2) null,
					departure_q integer null,
					departure_uc numeric(24,2) null,
					departure_total numeric(24,2)null,
					balance_total numeric(24,2) not null,
					balance_q integer not null,
					foreign key(product_warehouse_id) references product_warehouse(id)
				   );
				   
CREATE TABLE sales(id serial primary key,
				   	warehouse_id integer not null,
					customer_id integer not null,
				  	invoice varchar(155) not null,
				   	total numeric(24,2) not null,
				   foreign key(warehouse_id) references warehouse(warehouse_id),
				   foreign key(customer_id) references customer(customer_id)
				  );
CREATE TABLE sale_Detail(id serial primary key,
						sale_id integer not null,
						 product_id integer not null,
						 quantity integer not null,
						 unit_cost numeric(24,2) not null,
						 discount float not null,
						 total numeric(24,2) not null,
						 foreign key(sale_id) references sales(id),
						 foreign key(product_id) references product(product_id)
						);
						
ALTER TABLE provider ALTER COLUMN provider_name TYPE varchar(155);
ALTER TABLE warehouse ALTER COLUMN warehouse_name TYPE varchar(155);

-- ***************************************
-- 				INSERTS
-- ****************************************

-- PRODUCTOS
INSERT INTO public.product(product_code, cat_product_type, product_name, product_description, product_attributes, status, tx_id, tx_username, tx_host, tx_date)
	VALUES ('P01', 'DVD', 'La era del hielo 1', 0, '{}', 1, 1, 'root', '127.0.0.1', '2020-06-24 16:22:41.033735');
	
INSERT INTO public.product(product_code, cat_product_type, product_name, product_description, product_attributes, status, tx_id, tx_username, tx_host, tx_date)
	VALUES ('P02', 'DVD', 'El día despues de mañana', 0, '{}', 1, 1, 'root', '127.0.0.1', '2020-06-24 16:22:41.033735');
	
INSERT INTO public.product(product_code, cat_product_type, product_name, product_description, product_attributes, status, tx_id, tx_username, tx_host, tx_date)
	VALUES ('P03', 'DVD', 'África mia', 0, '{}', 1, 1, 'root', '127.0.0.1', '2020-06-24 16:22:41.033735');
	
INSERT INTO public.product(product_code, cat_product_type, product_name, product_description, product_attributes, status, tx_id, tx_username, tx_host, tx_date)
	VALUES ('P04', 'DVD', 'Al otro lado del viento', 0, '{}', 1, 1, 'root', '127.0.0.1', '2020-06-24 16:22:41.033735');
	
INSERT INTO public.product(product_code, cat_product_type, product_name, product_description, product_attributes, status, tx_id, tx_username, tx_host, tx_date)
	VALUES ('P05', 'DVD', 'La era del hielo 2', 0, '{}', 1, 1, 'root', '127.0.0.1', '2020-06-24 16:22:41.033735');

-- ALMACENES
ALTER TABLE public.warehouse ALTER COLUMN warehouse_name SET DATA TYPE varchar(255);

INSERT INTO public.warehouse(warehouse_name, warehouse_address, latitude, longitude, status, tx_id, tx_username, tx_host, tx_date)
	VALUES ('La Paz', 'Zona los olivos calle 4 #32', 156151.122, -1561561.123, 1, 1, 'root', '127.0.0.1', '2020-06-24 16:22:41.033735');
	
INSERT INTO public.warehouse(warehouse_name, warehouse_address, latitude, longitude, status, tx_id, tx_username, tx_host, tx_date)
	VALUES ('Santa Cruz', 'Zona los pinos calle 12 #322', 156151.122, -1561561.123, 1, 1, 'root', '127.0.0.1', '2020-06-24 16:22:41.033735');

INSERT INTO public.warehouse(warehouse_name, warehouse_address, latitude, longitude, status, tx_id, tx_username, tx_host, tx_date)
	VALUES ('Cochabamba', 'Zona los heroes calle 10 #1002', 156151.122, -1561561.123, 1, 1, 'root', '127.0.0.1', '2020-06-24 16:22:41.033735');

INSERT INTO public.warehouse(warehouse_name, warehouse_address, latitude, longitude, status, tx_id, tx_username, tx_host, tx_date)
	VALUES ('Tarija', 'Zona los robles calle 1 #1032', 156151.122, -1561561.123, 1, 1, 'root', '127.0.0.1', '2020-06-24 16:22:41.033735');

INSERT INTO public.warehouse(warehouse_name, warehouse_address, latitude, longitude, status, tx_id, tx_username, tx_host, tx_date)
	VALUES ('Sucre', 'Zona las lomas calle 6 #531', 156151.122, -1561561.123, 1, 1, 'root', '127.0.0.1', '2020-06-24 16:22:41.033735');
	
--PROVEEDORES
INSERT INTO public.provider(
	provider_name, cat_country, status, tx_id, tx_username, tx_host, tx_date)
	VALUES ('Peliculas J&C', 'Bolivia', 1, 1, 'root', '127.0.0.1', '2020-06-12 16:22:41.033735');

INSERT INTO public.provider(
	provider_name, cat_country, status, tx_id, tx_username, tx_host, tx_date)
	VALUES ('Movies', 'Bolivia', 1, 1, 'root', '127.0.0.1', '2020-06-12 16:22:41.033735');

-- PRODUCTO ALMACEN

--La Paz
INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (1, 1, 1, 0, 10, '2020-06-24');

INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (2, 1, 1, 0, 10, '2020-06-24');
	
INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (3, 1, 1, 0, 10, '2020-06-24');

INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (4, 1, 1, 0, 10, '2020-06-24');

INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (5, 1, 1, 0, 10, '2020-06-24');

-- Santa Cruz
INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (1, 2, 1, 0, 10, '2020-06-24');

INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (2, 2, 1, 0, 10, '2020-06-24');
	
INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (3, 2, 1, 0, 10, '2020-06-24');

INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (4, 2, 1, 0, 10, '2020-06-24');

INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (5, 2, 1, 0, 10, '2020-06-24');

-- Cochabamba
INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (1, 3, 1, 0, 10, '2020-06-24');

INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (2, 3, 1, 0, 10, '2020-06-24');
	
INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (3, 3, 1, 0, 10, '2020-06-24');

INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (4, 3, 1, 0, 10, '2020-06-24');

INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (5, 3, 1, 0, 10, '2020-06-24');

--Tarija
INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (1, 4, 1, 0, 10, '2020-06-24');

INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (2, 4, 1, 0, 10, '2020-06-24');
	
INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (3, 4, 1, 0, 10, '2020-06-24');

INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (4, 4, 1, 0, 10, '2020-06-24');

INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (5, 4, 1, 0, 10, '2020-06-24');

--Sucre
INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (1, 5, 1, 0, 10, '2020-06-24');

INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (2, 5, 1, 0, 10, '2020-06-24');
	
INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (3, 5, 1, 0, 10, '2020-06-24');

INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (4, 5, 1, 0, 10, '2020-06-24');

INSERT INTO public.product_warehouse(product_id, warehouse_id, provider_id, stock, m_stock, creation_date)
	VALUES (5, 5, 1, 0, 10, '2020-06-24');
	
-- ***************************************
-- 				KARDEX
-- ****************************************
--**************************************************************************************************
--				LA PAZ
--**************************************************************************************************
-- La Paz: warehouse_id "1"  |  product_id "1" ==> product_warehouse "1"
--ingreso:
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, income_q, income_uc, income_total, balance_total, balance_q)
	VALUES (1, 'Inventario inicial', '2020-06-25', 'F-0001', 20, 10, 200, 200, 20);
	
UPDATE product_warehouse SET stock = 20 WHERE id = 1;
--ingreso:
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, income_q, income_uc, income_total, balance_total, balance_q)
	VALUES (1, 'Compra', '2020-06-25', 'F-0002', 15, 10, 150, 350, 35);
	
UPDATE product_warehouse SET stock = 35 WHERE id = 1;
--salida
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, departure_q, departure_uc, departure_total, balance_total, balance_q)
	VALUES (1, 'Venta', '2020-06-26', '10001', 3, 10, 30, 320, 32);
	
UPDATE product_warehouse SET stock = 32 WHERE id = 1;

--*************************************************************************************
-- La Paz: warehouse_id "1"  |  product_id "2" ==> product_warehouse "2"
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, income_q, income_uc, income_total, balance_total, balance_q)
	VALUES (2, 'Inventario inicial', '2020-06-25', 'F-0001', 20, 10, 200, 200, 20);
	
UPDATE product_warehouse SET stock = 20 WHERE id = 2;
--ingreso:
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, income_q, income_uc, income_total, balance_total, balance_q)
	VALUES (2, 'Compra', '2020-06-25', 'F-0002', 15, 10, 150, 350, 35);
UPDATE product_warehouse SET stock = 35 WHERE id = 2;
--salida
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, departure_q, departure_uc, departure_total, balance_total, balance_q)
	VALUES (2, 'Venta', '2020-06-26', '10001', 3, 10, 30, 320, 32);
UPDATE product_warehouse SET stock = 32 WHERE id = 2;
--*************************************************************************************
-- La Paz: warehouse_id "1"  |  product_id "3" ==> product_warehouse "3"
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, income_q, income_uc, income_total, balance_total, balance_q)
	VALUES (3, 'Inventario inicial', '2020-06-25', 'F-0001', 20, 10, 200, 200, 20);
	
UPDATE product_warehouse SET stock = 20 WHERE id = 3;
--ingreso:
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, income_q, income_uc, income_total, balance_total, balance_q)
	VALUES (3, 'Compra', '2020-06-25', 'F-0002', 15, 10, 150, 350, 35);
UPDATE product_warehouse SET stock = 35 WHERE id = 3;
--salida
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, departure_q, departure_uc, departure_total, balance_total, balance_q)
	VALUES (3, 'Venta', '2020-06-26', '10001', 3, 10, 30, 320, 32);
UPDATE product_warehouse SET stock = 32 WHERE id = 3;
--*************************************************************************************
-- La Paz: warehouse_id "1"  |  product_id "4" ==> product_warehouse "4"
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, income_q, income_uc, income_total, balance_total, balance_q)
	VALUES (4, 'Inventario inicial', '2020-06-25', 'F-0001', 20, 10, 200, 200, 20);
	
UPDATE product_warehouse SET stock = 20 WHERE id = 4;
--ingreso:
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, income_q, income_uc, income_total, balance_total, balance_q)
	VALUES (4, 'Compra', '2020-06-25', 'F-0002', 15, 10, 150, 350, 35);
UPDATE product_warehouse SET stock = 35 WHERE id = 4;
--salida
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, departure_q, departure_uc, departure_total, balance_total, balance_q)
	VALUES (4, 'Venta', '2020-06-26', '10001', 3, 10, 30, 320, 32);
UPDATE product_warehouse SET stock = 32 WHERE id = 4;
--*************************************************************************************
-- La Paz: warehouse_id "1"  |  product_id "5" ==> product_warehouse "5"
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, income_q, income_uc, income_total, balance_total, balance_q)
	VALUES (5, 'Inventario inicial', '2020-06-25', 'F-0001', 20, 10, 200, 200, 20);
	
UPDATE product_warehouse SET stock = 20 WHERE id = 5;
--ingreso:
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, income_q, income_uc, income_total, balance_total, balance_q)
	VALUES (5, 'Compra', '2020-06-25', 'F-0002', 15, 10, 150, 350, 35);
UPDATE product_warehouse SET stock = 35 WHERE id = 5;
--salida
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, departure_q, departure_uc, departure_total, balance_total, balance_q)
	VALUES (5, 'Venta', '2020-06-26', '10001', 3, 10, 30, 320, 32);
UPDATE product_warehouse SET stock = 32 WHERE id = 5;

--**************************************************************************************************
--				SANTA CRUZ
--**************************************************************************************************
-- SantaCruz: warehouse_id "2"  |  product_id "1" ==> product_warehouse "6"
--ingreso:
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, income_q, income_uc, income_total, balance_total, balance_q)
	VALUES (6, 'Inventario inicial', '2020-06-25', 'F-0001', 20, 10, 200, 200, 20);
	
UPDATE product_warehouse SET stock = 20 WHERE id = 6;
--ingreso:
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, income_q, income_uc, income_total, balance_total, balance_q)
	VALUES (6, 'Compra', '2020-06-25', 'F-0002', 15, 10, 150, 350, 35);
	
UPDATE product_warehouse SET stock = 35 WHERE id = 6;
--salida
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, departure_q, departure_uc, departure_total, balance_total, balance_q)
	VALUES (6, 'Venta', '2020-06-26', '10001', 3, 10, 30, 320, 32);
	
UPDATE product_warehouse SET stock = 32 WHERE id = 6;

--*************************************************************************************
-- SantaCruz: warehouse_id "2"  |  product_id "2" ==> product_warehouse "7"
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, income_q, income_uc, income_total, balance_total, balance_q)
	VALUES (7, 'Inventario inicial', '2020-06-25', 'F-0001', 20, 10, 200, 200, 20);
	
UPDATE product_warehouse SET stock = 20 WHERE id = 7;
--ingreso:
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, income_q, income_uc, income_total, balance_total, balance_q)
	VALUES (7, 'Compra', '2020-06-25', 'F-0002', 15, 10, 150, 350, 35);
UPDATE product_warehouse SET stock = 35 WHERE id = 7;
--salida
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, departure_q, departure_uc, departure_total, balance_total, balance_q)
	VALUES (7, 'Venta', '2020-06-26', '10001', 3, 10, 30, 320, 32);
UPDATE product_warehouse SET stock = 32 WHERE id = 7;
--*************************************************************************************
-- SantaCruz: warehouse_id "2"  |  product_id "3" ==> product_warehouse "8"
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, income_q, income_uc, income_total, balance_total, balance_q)
	VALUES (8, 'Inventario inicial', '2020-06-25', 'F-0001', 20, 10, 200, 200, 20);
	
UPDATE product_warehouse SET stock = 20 WHERE id = 8;
--ingreso:
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, income_q, income_uc, income_total, balance_total, balance_q)
	VALUES (8, 'Compra', '2020-06-25', 'F-0002', 15, 10, 150, 350, 35);
UPDATE product_warehouse SET stock = 35 WHERE id = 8;
--salida
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, departure_q, departure_uc, departure_total, balance_total, balance_q)
	VALUES (8, 'Venta', '2020-06-26', '10001', 3, 10, 30, 320, 32);
UPDATE product_warehouse SET stock = 32 WHERE id = 8;
--*************************************************************************************
-- SantaCruz: warehouse_id "2"  |  product_id "4" ==> product_warehouse "9"
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, income_q, income_uc, income_total, balance_total, balance_q)
	VALUES (9, 'Inventario inicial', '2020-06-25', 'F-0001', 20, 10, 200, 200, 20);
	
UPDATE product_warehouse SET stock = 20 WHERE id = 9;
--ingreso:
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, income_q, income_uc, income_total, balance_total, balance_q)
	VALUES (9, 'Compra', '2020-06-25', 'F-0002', 15, 10, 150, 350, 35);
UPDATE product_warehouse SET stock = 35 WHERE id = 9;
--salida
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, departure_q, departure_uc, departure_total, balance_total, balance_q)
	VALUES (9, 'Venta', '2020-06-26', '10001', 3, 10, 30, 320, 32);
UPDATE product_warehouse SET stock = 32 WHERE id = 9;
--*************************************************************************************
-- SantaCruz: warehouse_id "2"  |  product_id "5" ==> product_warehouse "10"
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, income_q, income_uc, income_total, balance_total, balance_q)
	VALUES (10, 'Inventario inicial', '2020-06-25', 'F-0001', 20, 10, 200, 200, 20);
	
UPDATE product_warehouse SET stock = 20 WHERE id = 10;
--ingreso:
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, income_q, income_uc, income_total, balance_total, balance_q)
	VALUES (10, 'Compra', '2020-06-25', 'F-0002', 15, 10, 150, 350, 35);
UPDATE product_warehouse SET stock = 35 WHERE id = 10;
--salida
INSERT INTO public.kardex(
	product_warehouse_id, concept, kdate, invoice, departure_q, departure_uc, departure_total, balance_total, balance_q)
	VALUES (10, 'Venta', '2020-06-26', '10001', 3, 10, 30, 320, 32);
UPDATE product_warehouse SET stock = 32 WHERE id = 10;

