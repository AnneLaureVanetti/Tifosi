USE tifosi;

INSERT INTO `ingredient` (`id_ingredient`, `name_ingredient`)VALUES
(1,'Ail'),
(2,	'Ananas'),
(3,	'Artichaut'),
(4,	'Bacon'),
(5,	'Base Tomate'),
(6,	'Base crème'),
(7,	'Champignon'),
(8,	'Chevre'),
(9,	'Cresson'),
(10, 'Emmental'),
(11, 'Gorgonzola'),
(12, 'Jambon cuit'),
(13, 'Jambon fumé'),
(14, 'Oeuf'),
(15, 'Oignon'),
(16, 'Olive noire'),
(17, 'Olive verte'),
(18, 'Parmesan'),
(19, 'Piment'),
(20, 'Poivre'),
(21, 'Pomme de terre'),
(22, 'Raclette'),
(23, 'Salami'),
(24, 'Tomate cerise'),
(25, 'Mozarella');


INSERT INTO `focaccia` (  `id_focaccia`, `name_focaccia`,`price_focaccia`)VALUES
(1,	'Mozaccia',	9.80),
(2,	'Gorgonzollaccia', 10.80),
(3,	'Raclaccia', 8.90),
(4,	'Emmentalaccia', 9.80),
(5,	'Tradizione', 8.90),
(6,	'Hawaienne', 11.20),
(7,	'Américaine', 10.80),
(8,	'Paysanne',	12.80);


INSERT INTO `recette` (`id_focaccia`, `id_ingredient`, `quantite`) VALUES
-- Mozaccia
(1, 5, 200),   -- Base tomate
(1, 25, 50),   -- Mozarella
(1, 9, 20),    -- Cresson
(1, 13, 80),   -- Jambon fumé
(1, 1, 2),     -- Ail
(1, 3, 20),    -- Artichaut
(1, 7, 40),    -- Champignon
(1, 18, 50),   -- Parmesan
(1, 20, 1),    -- Poivre
(1, 16, 20),   -- Olive noire

-- Gorgonzollaccia
(2, 5, 200),   -- Base tomate
(2, 11, 50),   -- Gorgonzola
(2, 9, 20),    -- Cresson
(2, 1, 2),     -- Ail
(2, 7, 40),    -- Champignon
(2, 18, 50),   -- Parmesan
(2, 20, 1),    -- Poivre
(2, 16, 20),   -- Olive noire

-- Raclaccia
(3, 5, 200),   -- Base tomate
(3, 22, 50),   -- Raclette
(3, 9, 20),    -- Cresson
(3, 1, 2),     -- Ail
(3, 7, 40),    -- Champignon
(3, 18, 50),   -- Parmesan
(3, 20, 1),    -- Poivre

-- Emmentalaccia
(4, 6, 200),   -- Base crème
(4, 10, 50),   -- Emmental
(4, 9, 20),    -- Cresson
(4, 7, 40),    -- Champignon
(4, 18, 50),   -- Parmesan
(4, 20, 1),    -- Poivre
(4, 15, 20),   -- Oignon

-- Tradizione
(5, 5, 200),   -- Base tomate
(5, 25, 50),   -- Mozarella
(5, 9, 20),    -- Cresson
(5, 12, 80),   -- Jambon cuit
(5, 7, 80),    -- Champignon (exception : 80 au lieu de 40)
(5, 18, 50),   -- Parmesan
(5, 20, 1),    -- Poivre
(5, 16, 10),   -- Olive noire (exception : 10 au lieu de 20)
(5, 17, 10),   -- Olive verte (exception : 10 au lieu de 20)

-- Hawaienne
(6, 5, 200),   -- Base tomate
(6, 25, 50),   -- Mozarella
(6, 9, 20),    -- Cresson
(6, 4, 80),    -- Bacon
(6, 2, 40),    -- Ananas
(6, 19, 2),    -- Piment
(6, 18, 50),   -- Parmesan
(6, 20, 1),    -- Poivre
(6, 16, 20),   -- Olive noire

-- Américaine
(7, 5, 200),   -- Base tomate
(7, 25, 50),   -- Mozarella
(7, 9, 20),    -- Cresson
(7, 4, 80),    -- Bacon
(7, 21, 40),   -- Pomme de terre (exception : 40 au lieu de 80)
(7, 18, 50),   -- Parmesan
(7, 20, 1),    -- Poivre
(7, 16, 20),   -- Olive noire

-- Paysanne
(8, 6, 200),   -- Base crème
(8, 8, 50),    -- Chèvre
(8, 9, 20),    -- Cresson
(8, 21, 80),   -- Pomme de terre
(8, 13, 80),   -- Jambon fumé
(8, 1, 2),     -- Ail
(8, 3, 20),    -- Artichaut
(8, 7, 40),    -- Champignon
(8, 18, 50),   -- Parmesan
(8, 20, 1),    -- Poivre
(8, 16, 20),   -- Olive noire
(8, 14, 50);   -- Œuf

INSERT INTO `marque` ( `id_marque`,`name_marque`)VALUES
(1, 'Coca-cola'),
(2, 'Cristalline'),
(3, 'Monster'),
(4, 'Pepsico');


INSERT INTO `boisson` ( `id_boisson`,`name_boisson`,`id_marque`) VALUES
(1, 'Coca-cola zéro', 1),
(2,	'Coca-cola original', 1),
(3,	'Fanta citron', 1),
(4,	'Fanta orange', 1),
(5,	'Capri-sun', 1),
(6,	'Pepsi', 4),
(7,	'Pepsi Max Zéro', 4),
(8,	'Lipton zéro citron', 4),
(9,	'Lipton Peach', 4),
(10, 'Monster energy ultra gold', 3),
(11, 'Monster energy ultra blue', 3),
(12, 'Eau de source', 2);



-- Les tables menu, client, menu_boisson et menu_client restent vides :
-- aucune donnée de test n'a été fournie pour elles.