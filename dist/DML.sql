USE hopi_hari_db;

INSERT INTO users (first_name, last_name, email, password, birth_date, phone)
VALUES  ("lo", "miranda", "lo@gmail.com", "$2b$10$x3TJGwflhcDiiiNYIsdzYOCty4B44tDi2yX3unm4vQtYFUCotp0RO", "2025-05-09", "14887956022"),
		("manu", "pereira", "manu@email.com", "$2b$10$/JZfGZMxAzuOhHupOxm1o.KGvVId4lmLeNDK0cvSXQ.fY04OBv4s6", "2025-02-03", "14995846033"),
		("ju", "wada", "wada@gmail.com", "$2b$10$87ctfPqjQMYIVfWzdW1oWO4RI3H0LvAW/DyINjnYejzLiHIXFDpo6", "2025-10-11", "14997586022");

INSERT INTO rides (name, waiting_time, status, area)
VALUES  ("Trem Fantasma", 5, "aberto", "1"),
        ("Montanha Russa", 2, "aberto", "2"),
        ("Roda Gigante", 3, "aberto", "3");

INSERT INTO `lines` (id_ride, id_user)
VALUES  (8, 10), 
        (8, 11),
        (9, 11),
        (9, 12),
        (10, 10),
        (10, 12);

SELECT users.first_name        AS name,
       rides.`name`            AS brinquedo,
       `lines`.*
FROM   `lines`
INNER JOIN   users     ON users.id = `lines`.id_user
INNER JOIN   rides     ON rides.id = `lines`.id_ride
WHERE  rides.area = '1';



---------------------------------------------------------------------------------------------




INSERT INTO areas (name) VALUES ("Aribabiba");
INSERT INTO areas (name) VALUES ("Kaminda Mundi");
INSERT INTO areas (name) VALUES ("Mistieri");
INSERT INTO areas (name) VALUES ("Wild West");
INSERT INTO areas (name) VALUES ("Infantasia");



INSERT INTO rides (name, waiting_time, status, areas_id)
VALUES 
('NAMUSKITA', 0, 'open', (SELECT id FROM areas WHERE name = 'Wild West')),
('LA MINA DEL JOE SACRAMENTO', 0, 'open', (SELECT id FROM areas WHERE name = 'Wild West')),
('EVOLUTION', 0, 'open', (SELECT id FROM areas WHERE name = 'Wild West')),
('BRAVO BULL', 0, 'open', (SELECT id FROM areas WHERE name = 'Wild West')),
('GHOSTI HOTEL', 0, 'open', (SELECT id FROM areas WHERE name = 'Wild West')),
('RIO BRAVO', 0, 'open', (SELECT id FROM areas WHERE name = 'Wild West')),
('VAMVOLARI', 0, 'open', (SELECT id FROM areas WHERE name = 'Wild West')),
('SPLESHI', 0, 'open', (SELECT id FROM areas WHERE name = 'Wild West')),
('TIROLESA', 0, 'open', (SELECT id FROM areas WHERE name = 'Wild West'));

INSERT INTO rides (name, waiting_time, status, areas_id)
VALUES 
('KATAKUMB', 16, 'open', (SELECT id FROM areas WHERE name = 'Mistieri')),
('EKATOMB', 10, 'open', (SELECT id FROM areas WHERE name = 'Mistieri')),
('MONTEZUM', 4, 'open', (SELECT id FROM areas WHERE name = 'Mistieri')),
('SIMULÁKRON', 6, 'open', (SELECT id FROM areas WHERE name = 'Mistieri')),
('VULAVIKING', 5, 'open', (SELECT id FROM areas WHERE name = 'Mistieri')),
('VURANG', 8, 'open', (SELECT id FROM areas WHERE name = 'Mistieri'));

INSERT INTO rides (name, waiting_time, status, areas_id)
VALUES 
('THEATRO DI KAMINDA', 30, 'open', (SELECT id FROM areas WHERE name = 'Kaminda Mundi')),
('GIRANDA MUNDI', 8, 'open', (SELECT id FROM areas WHERE name = 'Kaminda Mundi')),
('JOGAKÍ DI KAMINDA', 10, 'open', (SELECT id FROM areas WHERE name = 'Kaminda Mundi')),
('LE VOYAGE', 15, 'open', (SELECT id FROM areas WHERE name = 'Kaminda Mundi'));

INSERT INTO rides (name, waiting_time, status, areas_id)
VALUES 
('SPEEDI ´64', 5, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('VAMBATÊ', 3, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('CINEMOTION', 7, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('KATAPUL', 1, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('JAMBALAIA', 2, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('ARIBABOBBI', 8, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('PARANGOLÉ', 3, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba')),
('HADIKALI', 1, 'open', (SELECT id FROM areas WHERE name = 'Aribabiba'));

INSERT INTO rides (name, waiting_time, status, areas_id)
VALUES 
('KASTEL DI LENDAS', 12, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('GIRANDA POKOTÓ', 13, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('TOKA DO UGA', 1, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('BUGABALUM', 15, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('GIRALATA', 5, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('DISPENKITO', 2, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('KOMBOIO', 3, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('ASTRONAVI', 6, 'open', (SELECT id FROM areas WHERE name = 'Infantasia')),
('KLAPI KLAPI', 8, 'open', (SELECT id FROM areas WHERE name = 'Infantasia'));